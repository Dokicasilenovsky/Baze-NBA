DROP TABLE IF EXISTS player_stats CASCADE;
DROP TABLE IF EXISTS player_game CASCADE;
DROP TABLE IF EXISTS matches CASCADE;
DROP TABLE IF EXISTS player_team CASCADE;
DROP TABLE IF EXISTS season CASCADE;
DROP TABLE IF EXISTS player CASCADE;
DROP TABLE IF EXISTS team CASCADE;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    stadion VARCHAR(50),
    city VARCHAR(50),
	conference VARCHAR(20)
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    height VARCHAR(10),
    draft_year INT
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    year INT
);

CREATE TABLE player_team (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES player(id),
    team_id INT REFERENCES team(id),
    season_id INT REFERENCES season(id),
    transfer_year INT,
    jersey_number INT
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INT REFERENCES team(id),
    away_team_id INT REFERENCES team(id),
    season_id INT REFERENCES season(id),
    date DATE,
    result VARCHAR(20),
	game_type VARCHAR(20)

);

CREATE TABLE player_game (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES player(id),
    match_id INT REFERENCES matches(id)
);

CREATE TABLE player_stats (
    id SERIAL PRIMARY KEY,
    player_id INT REFERENCES player(id),
    avg_points NUMERIC(5,2),
    avg_assists NUMERIC(5,2),
    avg_rebounds NUMERIC(5,2),
    avg_fouls NUMERIC(5,2),
    avg_blocks NUMERIC(5,2),
    games_played NUMERIC(5,2),
    free_throw_pct NUMERIC(5,2),
    two_point_pct NUMERIC(5,2),
    three_point_pct NUMERIC(5,2)
);

INSERT INTO season (year) VALUES
(2024),
(2025),
(2026);



