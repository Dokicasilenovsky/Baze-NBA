import os
import pandas as pd
from nba_api.stats.static import players
from nba_api.stats.endpoints import leaguedashplayerstats


PLAYER_FILE = "players_clean.txt"
OUTPUT_SQL = "player_stats.sql"
SEASON = "2025-26"


def load_players(file_path):
    df = pd.read_csv(file_path, header=None, names=["name", "player_id"])
    df["name"] = df["name"].str.replace('"', '', regex=False)
    return list(df.itertuples(index=False, name=None))


def get_nba_player_id(name):
    result = players.find_players_by_full_name(name)
    return result[0]["id"] if result else None


def fetch_stats():
    stats = leaguedashplayerstats.LeagueDashPlayerStats(
        season=SEASON,
        per_mode_detailed="PerGame"
    )
    return stats.get_data_frames()[0]


def pct(x):
    return round(x * 100, 3) if x is not None else 0


def main():
    players_list = load_players(PLAYER_FILE)
    df = fetch_stats()
    stats_map = df.set_index("PLAYER_ID").to_dict("index")

    values = []

    for name, player_id in players_list:
        nba_id = get_nba_player_id(name)

        if nba_id is None or nba_id not in stats_map:
            print(f"SKIP: {name}")
            continue

        r = stats_map[nba_id]

        fgm = r.get("FGM", 0)
        fga = r.get("FGA", 0)
        fg3m = r.get("FG3M", 0)
        fg3a = r.get("FG3A", 0)

        fg2m = fgm - fg3m
        fg2a = fga - fg3a

        fg2_pct = (fg2m / fg2a) if fg2a else 0

        values.append(f"""(
    {player_id},
    {r.get("PTS", 0)},
    {r.get("AST", 0)},
    {r.get("REB", 0)},
    {r.get("PF", 0)},
    {r.get("BLK", 0)},
    {r.get("GP", 0)},
    {pct(r.get("FT_PCT", 0))},
    {pct(fg2_pct)},
    {pct(r.get("FG3_PCT", 0))}
)""")

        print(f"OK: {name}")

    sql = (
        "-- AUTO GENERATED PLAYER STATS\n\n"
        "INSERT INTO player_stats (\n"
        "    player_id,\n"
        "    avg_points,\n"
        "    avg_assists,\n"
        "    avg_rebounds,\n"
        "    avg_fouls,\n"
        "    avg_blocks,\n"
        "    games_played,\n"
        "    free_throw_pct,\n"
        "    two_point_pct,\n"
        "    three_point_pct\n"
        ")\nVALUES\n" +
        ",\n".join(values) +
        ";"
    )

    with open(OUTPUT_SQL, "w", encoding="utf-8") as f:
        f.write(sql)

    print(f"\nDONE -> {OUTPUT_SQL}")


if __name__ == "__main__":
    main()