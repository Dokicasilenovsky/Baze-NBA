from nba_api.stats.endpoints import boxscoretraditionalv2

matches = []

with open("matches_ids.txt", "r") as f:
    matches = [line.strip() for line in f.readlines()]

player_game_values = []
player_stats_values = []

def esc(name):
    return name.replace("'", "''")

for match_id in matches:

    try:
        box = boxscoretraditionalv2.BoxScoreTraditionalV2(game_id=match_id)
        df = box.get_data_frames()[0]
    except:
        continue

    for _, row in df.iterrows():

        player_name = esc(row["PLAYER_NAME"])

        points = int(row["PTS"] or 0)
        assists = int(row["AST"] or 0)
        rebounds = int(row["REB"] or 0)
        blocks = int(row["BLK"] or 0)
        fouls = int(row["TO"] or 0)
        ft = int(row["FTM"] or 0)
        two = int(row["FGM"] or 0)
        three = int(row["FG3M"] or 0)

        player_game_values.append(
            f"((SELECT id FROM player WHERE name = '{player_name}'), {match_id})"
        )

        player_stats_values.append(
            f"(LASTVAL(), {blocks}, {points}, {assists}, {rebounds}, {fouls}, {ft}, {two}, {three})"
        )

sql = ""

if player_game_values:
    sql += "INSERT INTO player_game (player_id, match_id) VALUES\n"
    sql += ",\n".join(player_game_values) + ";\n\n"

if player_stats_values:
    sql += "INSERT INTO player_stats (player_game_id, blocks, points, assists, rebounds, fouls, free_throw_points, two_point, three_point) VALUES\n"
    sql += ",\n".join(player_stats_values) + ";\n"

with open("player_stats_2025_26.sql", "w") as f:
    f.write(sql)

print("DONE")