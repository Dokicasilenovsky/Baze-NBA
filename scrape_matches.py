from nba_api.stats.endpoints import leaguegamefinder

# =========================
# CONFIG
# =========================
SEASON = "2025-26"
SEASON_ID_DB = 3  # tvoja 2026 sezona

# =========================
# TEAM MAP (tvoj DB)
# =========================
TEAM_MAP = {
    "Boston Celtics": 1,
    "Brooklyn Nets": 2,
    "New York Knicks": 3,
    "Philadelphia 76ers": 4,
    "Toronto Raptors": 5,

    "Chicago Bulls": 6,
    "Cleveland Cavaliers": 7,
    "Detroit Pistons": 8,
    "Indiana Pacers": 9,
    "Milwaukee Bucks": 10,

    "Atlanta Hawks": 11,
    "Charlotte Hornets": 12,
    "Miami Heat": 13,
    "Orlando Magic": 14,
    "Washington Wizards": 15,

    "Denver Nuggets": 16,
    "Minnesota Timberwolves": 17,
    "Oklahoma City Thunder": 18,
    "Portland Trail Blazers": 19,
    "Utah Jazz": 20,

    "Golden State Warriors": 21,
    "Los Angeles Lakers": 22,
    "LA Clippers": 23,
    "Phoenix Suns": 24,
    "Sacramento Kings": 25,

    "Dallas Mavericks": 26,
    "Houston Rockets": 27,
    "San Antonio Spurs": 28,
    "Memphis Grizzlies": 29,
    "New Orleans Pelicans": 30
}

# =========================
# SAFE TEAM LOOKUP
# =========================
def get_team_id(name):
    if name in TEAM_MAP:
        return TEAM_MAP[name]
    print("❌ Missing team:", name)
    return None

# =========================
# FETCH DATA (FIXED)
# =========================
gamefinder = leaguegamefinder.LeagueGameFinder(
    season_nullable=SEASON,
    league_id_nullable="00"
)

df = gamefinder.get_data_frames()[0]

# 🚨 IMPORTANT: NO SEASON_ID FILTER (to je bio bug)
# df = df[df["SEASON_ID"] == "22025"]  ❌ REMOVED

# =========================
# BUILD MATCHES
# =========================
matches = {}

for _, row in df.iterrows():
    gid = row["GAME_ID"]
    matchup = row["MATCHUP"]
    team_name = row["TEAM_NAME"]
    pts = row["PTS"]
    date = row["GAME_DATE"]

    if gid not in matches:
        matches[gid] = {
            "home_team": None,
            "away_team": None,
            "home_score": None,
            "away_score": None,
            "date": date
        }

    if "vs." in matchup:
        matches[gid]["home_team"] = team_name
        matches[gid]["home_score"] = pts
    else:
        matches[gid]["away_team"] = team_name
        matches[gid]["away_score"] = pts

# =========================
# GENERATE SQL
# =========================
sqls = []
seen = set()

for gid, m in matches.items():
    if gid in seen:
        continue
    seen.add(gid)

    if None in m.values():
        continue

    home_id = get_team_id(m["home_team"])
    away_id = get_team_id(m["away_team"])

    if not home_id or not away_id:
        continue

    result = f"{m['home_score']}-{m['away_score']}"

    sqls.append(f"""
INSERT INTO matches (home_team_id, away_team_id, season_id, date, result)
VALUES ({home_id}, {away_id}, {SEASON_ID_DB}, '{m['date']}', '{result}');
""".strip())

# =========================
# SAVE FILE
# =========================
with open("matches_2025_26.sql", "w") as f:
    f.write("\n\n".join(sqls))

print(f"✅ Done! Generated {len(sqls)} matches for {SEASON}")