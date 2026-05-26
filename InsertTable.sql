INSERT INTO Player (name, age, height, draft_year) VALUES 
('Lamelo Ball', 24, '6ft7', 2020),
('Miles Bridges', 28, '6ft7', 2018),
('Kon Knueppel', 20, '6ft6', 2025),
('Grant Williams', 27, '6ft7', 2019),
('Coby White', 26, '6ft4', 2019),
('Sion James', 23, '6ft5', 2025),
('Lebron James', 41, '6ft9', 2003),
('Bronny James', 21, '6ft2', 2024),
('Luka Dončić', 27, '6ft8', 2018),
('Austin Reaves', 27, '6ft5', 2021),
('Marcus Smart', 32, '6ft3', 2014),
('Luke Kennard', 29, '6ft5', 2017),
('Nikola Jokić', 31, '6ft11', 2014),
('Jamal Murray', 29, '6ft4', 2016),
('Aaron Gordon', 30, '6ft8', 2014),
('Jalen Pickett', 26, '6ft2', 2023),
('Tim Hardaway Jr', 34, '6ft5', 2013);

INSERT INTO Team (name, stadion, city) VALUES
('Charlotte Hornets', 'Spectrum Center', 'Charlotte'),
('LA Lakers', 'Crypto.com Arena', 'Los Angeles'),
('Denver Nuggets', 'Ball Arena', 'Denver');

INSERT INTO Player_Team (player_id,team_id,season_id,transfer_year,jersey_number) VALUES
(7,2,3,2018,23),
(1,1,3,2020,1),
(9,2,3,2025,77);

SELECT * FROM Player_Team
TRUNCATE TABLE Player RESTART IDENTITY CASCADE;