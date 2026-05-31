from nba_api.stats.static import teams
from nba_api.stats.endpoints import CommonTeamRoster, CommonPlayerInfo, playercareerstats
import pandas as pd
import time
import re

# This script scrapes player-team relationships and includes:
# - `player_seq_id`: sequential ID starting at 1 in scrape order
# - `team_seq_id`: sequential ID for teams in the order returned by `teams.get_teams()` (starts at 1)
# - `season_id`: fixed to 1
# - `transfer_year`: inferred first season year the player appeared for that team (if available)
# - `jersey`: current jersey number (if available)

player_team_records = []
players = []

nba_teams = teams.get_teams()

# Build team sequence mapping (NBA API team id -> sequential team id)
team_apiid_to_seq = {}
for idx, t in enumerate(nba_teams, start=1):
    team_apiid_to_seq[t["id"]] = idx

def _parse_season_to_year(season_id):
    if season_id is None or (isinstance(season_id, float) and pd.isna(season_id)):
        return None
    s = str(season_id)
    m = re.search(r"(\d{4})", s)
    if m:
        try:
            return int(m.group(1))
        except:
            return None
    try:
        return int(float(s))
    except:
        return None

next_player_seq_id = 1

for team in nba_teams:

    team_api_id = team["id"]
    team_name = team["full_name"]
    team_seq_id = team_apiid_to_seq.get(team_api_id)

    print(f"Scraping {team_name}")

    try:
        roster = CommonTeamRoster(team_id=team_api_id)
        roster_df = roster.get_data_frames()[0]

        for _, row in roster_df.iterrows():

            # NBA API numeric player id from roster
            nba_player_api_id = None
            for col in ("PLAYER_ID", "PERSON_ID", "player_id"):
                if col in row.index and pd.notna(row.get(col)):
                    nba_player_api_id = int(row.get(col))
                    break

            if not nba_player_api_id:
                continue

            try:
                player_info = CommonPlayerInfo(player_id=nba_player_api_id)
                info_df = player_info.get_data_frames()[0]

                if len(info_df) == 0:
                    continue

                info = info_df.iloc[0]

                name = info.get("DISPLAY_FIRST_LAST") if "DISPLAY_FIRST_LAST" in info.index else None

                # Age: prefer AGE field, otherwise compute from BIRTHDATE
                age = None
                raw_age = info.get("AGE") if hasattr(info, 'get') else None
                if raw_age and raw_age != "":
                    try:
                        age = int(float(raw_age))
                    except Exception:
                        age = None
                else:
                    try:
                        bdate = info.get("BIRTHDATE") if hasattr(info, 'get') else None
                        if bdate and bdate != "":
                            bts = pd.to_datetime(bdate, errors="coerce")
                            if not pd.isna(bts):
                                today = pd.Timestamp("today")
                                age = int((today - bts).days // 365)
                    except Exception:
                        age = None

                height = info.get("HEIGHT") if hasattr(info, 'get') else None
                if isinstance(height, str) and "-" in height:
                    try:
                        ft, inch = height.split("-")
                        height = f"{ft}ft{inch}"
                    except Exception:
                        pass

                draft_year = info.get("DRAFT_YEAR") if hasattr(info, 'get') else None
                try:
                    draft_year = int(draft_year)
                except Exception:
                    draft_year = None

                # Try to get jersey from roster row first, then from player info
                jersey = None
                for jcol in ("NUM", "JERSEY", "jersey", "NUMBER"):
                    if jcol in row.index and pd.notna(row.get(jcol)):
                        jersey = row.get(jcol)
                        break
                if not jersey:
                    # some CommonPlayerInfo responses include 'JERSEY'
                    try:
                        jersey = info.get("JERSEY") if hasattr(info, 'get') else None
                    except Exception:
                        jersey = None

                # normalize jersey to int when possible
                if jersey is not None:
                    try:
                        j = str(jersey).strip()
                        j = j.lstrip("#")
                        jersey = int(float(j))
                    except Exception:
                        jersey = None

                # Determine transfer_year by checking player's career seasons for this team
                transfer_year = None
                try:
                    career = playercareerstats.PlayerCareerStats(player_id=nba_player_api_id)
                    career_dfs = career.get_data_frames()
                    career_df = None
                    for df in career_dfs:
                        if 'TEAM_ID' in df.columns and ('SEASON_ID' in df.columns or 'SEASON' in df.columns):
                            career_df = df
                            break

                    if career_df is not None:
                        # match by NBA API team id
                        matches = career_df[career_df['TEAM_ID'] == team_api_id]
                        if matches.empty:
                            # fallback: try matching by abbreviation or team name
                            if 'TEAM_ABBREVIATION' in career_df.columns and team.get('abbreviation'):
                                matches = career_df[career_df['TEAM_ABBREVIATION'] == team.get('abbreviation')]
                            if matches.empty and 'TEAM_NAME' in career_df.columns:
                                matches = career_df[career_df['TEAM_NAME'] == team_name]

                        if not matches.empty:
                            season_col = 'SEASON_ID' if 'SEASON_ID' in matches.columns else ('SEASON' if 'SEASON' in matches.columns else None)
                            if season_col:
                                seasons = matches[season_col].dropna().unique()
                                earliest = None
                                for s in seasons:
                                    y = _parse_season_to_year(s)
                                    if y is not None and (earliest is None or y < earliest):
                                        earliest = y
                                transfer_year = earliest
                except Exception:
                    transfer_year = None

                # Compose player-team record: (player_seq_id, team_seq_id, season_id, transfer_year, jersey, nba_player_api_id, nba_team_api_id, player_name)
                record = (
                    next_player_seq_id,
                    team_seq_id,
                    1,
                    transfer_year,
                    jersey,
                )

                player_team_records.append(record)

                # Keep previous players list too (for compatibility)
                players.append((name, age, height, draft_year, team_name))

                print(str(record) + ",")

                next_player_seq_id += 1

                # Sleep briefly to avoid rate limits
                time.sleep(0.6)

            except Exception as e:
                print(f"Player error {nba_player_api_id}: {e}")

    except Exception as e:
        print(f"Team error {team_name}: {e}")

# Export player-team mappings
pd.DataFrame(
    player_team_records,
    columns=[
        "player_seq_id",
        "team_seq_id",
        "season_id",
        "transfer_year",
        "jersey",
    ],
).to_csv("player_team.csv", index=False)

with open("player_team.txt", "w", encoding="utf-8") as f:
    for rec in player_team_records:
        f.write(str(rec) + ",\n")

# Export players as before
pd.DataFrame(
    players,
    columns=["name", "age", "height", "draft_year", "team"],
).to_csv("nba_players.csv", index=False)

with open("nba_players.txt", "w", encoding="utf-8") as f:
    for player in players:
        f.write(str(player) + ",\n")

print(f"\nScraped {len(player_team_records)} player-team records.")