from nba_api.stats.static import teams
from nba_api.stats.endpoints import CommonTeamRoster
from nba_api.stats.endpoints import CommonPlayerInfo
import pandas as pd
import time

players = []

nba_teams = teams.get_teams()

for team in nba_teams:

    team_id = team["id"]
    team_name = team["full_name"]

    print(f"Scraping {team_name}")

    try:
        roster = CommonTeamRoster(team_id=team_id)

        roster_df = roster.get_data_frames()[0]

        for _, row in roster_df.iterrows():

            player_id = row["PLAYER_ID"]

            try:
                player_info = CommonPlayerInfo(player_id=player_id)

                info_df = player_info.get_data_frames()[0]

                if len(info_df) == 0:
                    continue

                info = info_df.iloc[0]

                name = info["DISPLAY_FIRST_LAST"]

                # Determine age: prefer `AGE` field, otherwise compute from `BIRTHDATE`
                age = None
                try:
                    raw_age = info.get("AGE") if hasattr(info, 'get') else info["AGE"]
                except Exception:
                    raw_age = None

                if raw_age is not None and raw_age != "":
                    try:
                        age = int(float(raw_age))
                    except Exception:
                        age = None
                else:
                    # fallback: compute from BIRTHDATE if available
                    try:
                        bdate = info.get("BIRTHDATE") if hasattr(info, 'get') else info["BIRTHDATE"]
                        if bdate and bdate != "":
                            # parse with pandas to handle multiple formats
                            bts = pd.to_datetime(bdate, errors="coerce")
                            if not pd.isna(bts):
                                today = pd.Timestamp("today")
                                age = int((today - bts).days // 365)
                    except Exception:
                        age = None

                height = info["HEIGHT"]

                if isinstance(height, str) and "-" in height:
                    ft, inch = height.split("-")
                    height = f"{ft}ft{inch}"

                draft_year = info["DRAFT_YEAR"]

                try:
                    draft_year = int(draft_year)
                except:
                    draft_year = None

                record = (
                    name,
                    age,
                    height,
                    draft_year,
                    team_name
                )

                players.append(record)

                print(str(record) + ",")

                time.sleep(0.6)

            except Exception as e:
                print(
                    f"Player error {player_id}: {e}"
                )

    except Exception as e:
        print(
            f"Team error {team_name}: {e}"
        )

pd.DataFrame(
    players,
    columns=[
        "name",
        "age",
        "height",
        "draft_year",
        "team"
    ]
).to_csv(
    "nba_players.csv",
    index=False
)

with open(
    "nba_players.txt",
    "w",
    encoding="utf-8"
) as f:

    for player in players:
        f.write(str(player) + ",\n")

print(f"\nScraped {len(players)} players.")