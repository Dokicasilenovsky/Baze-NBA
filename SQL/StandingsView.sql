CREATE OR REPLACE VIEW standings_raw AS
WITH all_games AS (
    SELECT
        m.season_id,
        t.conference,
        m.home_team_id AS team_id,
        CASE WHEN split_part(m.result,'-',1)::int > split_part(m.result,'-',2)::int THEN 1 ELSE 0 END AS win,
        CASE WHEN split_part(m.result,'-',1)::int < split_part(m.result,'-',2)::int THEN 1 ELSE 0 END AS loss
    FROM matches m
    JOIN team t ON t.id = m.home_team_id
    WHERE m.game_type = 'regular'

    UNION ALL

    SELECT
        m.season_id,
        t.conference,
        m.away_team_id AS team_id,
        CASE WHEN split_part(m.result,'-',2)::int > split_part(m.result,'-',1)::int THEN 1 ELSE 0 END AS win,
        CASE WHEN split_part(m.result,'-',2)::int < split_part(m.result,'-',1)::int THEN 1 ELSE 0 END AS loss
    FROM matches m
    JOIN team t ON t.id = m.away_team_id
    WHERE m.game_type = 'regular'
)

SELECT
    season_id,
    conference,
    team_id,
    SUM(win) AS wins,
    SUM(loss) AS losses,
    ROUND(SUM(win)::numeric / NULLIF(SUM(win + loss),0), 3) AS win_pct
FROM all_games
GROUP BY season_id, conference, team_id;