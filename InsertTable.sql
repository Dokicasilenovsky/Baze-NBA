/*Neka na pocetku stoji ovo za brisanje tablica tako da ne moramo pamtit sta je stavljeno sta je novo nego svaki put izbrise prije stavljanja svih podataka ispocetka*/
TRUNCATE TABLE Player RESTART IDENTITY CASCADE 
TRUNCATE TABLE Team RESTART IDENTITY CASCADE
TRUNCATE TABLE Player_Team RESTART IDENTITY CASCADE

INSERT INTO Player (name, age, height, draft_year) VALUES 

/*Charlotte Hornets*/
('Lamelo Ball', 24, '6ft7', 2020),
('Miles Bridges', 28, '6ft7', 2018),
('Kon Knueppel', 20, '6ft6', 2025),
('Grant Williams', 27, '6ft7', 2019),
('Coby White', 26, '6ft4', 2019),
('Sion James', 23, '6ft5', 2025),
('Josh Green', 25, '6ft6', 2020),
('Ryan Kalkbrenner', 24, '7ft1', 2025),
('Antonio Reeves', 25, '6ft5', 2024),
('Moussa Diabaté', 24, '6ft10', 2022),
('Pj Hall', 24, '6ft8', 0), 			/*Zaboravia sam sta smo stavili za Undrafted pa cu ih stavljat 0 da ih je lakse nac*/
('Tosan Evbuomwan', 25, '6ft8', 0),
('Pat Connaughton', 33, '6ft5', 2015),
('Tre Mann', 25, '6ft4', 2021),
('Brandon Miller', 23, '6ft7', 2023),
('Xavier Tillman', 27, '6ft8', 2020),
('Tidjane Salaün', 20, '6ft10', 2024),
('Liam Mcneeley', 20, '6ft7', 2025),

/*La Lakers*/
('Adou Thiero', 22, '6ft7', 2025),
('Jarred Vanderbilt', 27, '6ft8', 2018),
('Dalton Knecht', 25, '6ft6', 2024),
('Deandre Ayton', 27, '7ft', 2018),
('Bronny James', 21, '6ft2', 2024),
('Luke Kennard', 29, '6ft5', 2017),
('Jaxson Hayes', 26, '7ft', 2019),
('Jake Laravia', 24, '6ft7', 2022),
('Maxi Kleber', 34, '6ft10', 0),
('Austin Reaves', 27, '6ft5', 2021),
('Drew Timme', 25, '6ft9', 0),
('Nick Smith Jr', 22, '6ft2', 2023),
('Lebron James', 41, '6ft9', 2003),
('Rui Hachimura', 28, '6ft8', 2019),
('Chris Mañon', 24, '6ft4', 0),
('Marcus Smart', 32, '6ft3', 2014),
('Luka Dončić', 27, '6ft8', 2018),

/*Denver Nuggets*/
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
