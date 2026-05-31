/*Neka na pocetku stoji ovo za brisanje tablica tako da ne moramo pamtit sta je stavljeno sta je novo nego svaki put izbrise prije stavljanja svih podataka ispocetka*/
TRUNCATE TABLE Player RESTART IDENTITY CASCADE; 
TRUNCATE TABLE Team RESTART IDENTITY CASCADE;
TRUNCATE TABLE Player_Team RESTART IDENTITY CASCADE;

INSERT INTO player (name, age, height, draft_year, team_name) VALUES

('Trae Young', 27, '6ft1', 2018, 'Atlanta Hawks'),
('Jalen Johnson', 23, '6ft9', 2021, 'Atlanta Hawks'),
('Dejounte Murray', 28, '6ft5', 2016, 'Atlanta Hawks'),
('Onyeka Okongwu', 25, '6ft10', 2020, 'Atlanta Hawks'),
('Clint Capela', 31, '6ft10', 2014, 'Atlanta Hawks'),
('Bogdan Bogdanovic', 33, '6ft5', 2014, 'Atlanta Hawks'),

('Jayson Tatum', 28, '6ft8', 2017, 'Boston Celtics'),
('Jaylen Brown', 29, '6ft6', 2016, 'Boston Celtics'),
('Derrick White', 31, '6ft4', 2017, 'Boston Celtics'),
('Jrue Holiday', 35, '6ft4', 2009, 'Boston Celtics'),
('Kristaps Porzingis', 30, '7ft3', 2015, 'Boston Celtics'),
('Al Horford', 39, '6ft9', 2007, 'Boston Celtics'),

('Mikal Bridges', 29, '6ft6', 2018, 'Brooklyn Nets'),
('Cam Thomas', 24, '6ft4', 2021, 'Brooklyn Nets'),
('Nic Claxton', 26, '6ft11', 2019, 'Brooklyn Nets'),
('Ben Simmons', 29, '6ft10', 2016, 'Brooklyn Nets'),
('Dennis Schroder', 32, '6ft1', 2013, 'Brooklyn Nets'),
('Dorian Finney-Smith', 32, '6ft7', 2016, 'Brooklyn Nets'),

('Jalen Brunson', 29, '6ft2', 2018, 'New York Knicks'),
('Julius Randle', 31, '6ft8', 2014, 'New York Knicks'),
('OG Anunoby', 28, '6ft7', 2017, 'New York Knicks'),
('Mitchell Robinson', 27, '7ft0', 2018, 'New York Knicks'),
('Josh Hart', 30, '6ft4', 2017, 'New York Knicks'),
('Donte DiVincenzo', 28, '6ft4', 2018, 'New York Knicks'),

('Scottie Barnes', 25, '6ft7', 2021, 'Toronto Raptors'),
('RJ Barrett', 25, '6ft6', 2019, 'Toronto Raptors'),
('Immanuel Quickley', 26, '6ft3', 2020, 'Toronto Raptors'),
('Jakob Poeltl', 30, '7ft1', 2016, 'Toronto Raptors'),
('Gradey Dick', 22, '6ft6', 2023, 'Toronto Raptors'),
('Kelly Olynyk', 34, '6ft11', 2013, 'Toronto Raptors'),

('Joel Embiid', 32, '7ft0', 2014, 'Philadelphia 76ers'),
('Tyrese Maxey', 26, '6ft2', 2020, 'Philadelphia 76ers'),
('Kelly Oubre Jr.', 30, '6ft7', 2015, 'Philadelphia 76ers'),
('Paul Reed', 26, '6ft9', 2020, 'Philadelphia 76ers'),
('DeAnthony Melton', 28, '6ft2', 2018, 'Philadelphia 76ers'),

('Zach LaVine', 30, '6ft5', 2014, 'Chicago Bulls'),
('Coby White', 26, '6ft4', 2019, 'Chicago Bulls'),
('Nikola Vucevic', 34, '6ft10', 2011, 'Chicago Bulls'),
('Patrick Williams', 24, '6ft7', 2020, 'Chicago Bulls'),
('Ayo Dosunmu', 26, '6ft5', 2021, 'Chicago Bulls'),
('Lonzo Ball', 28, '6ft6', 2017, 'Chicago Bulls'),

('Giannis Antetokounmpo', 31, '6ft11', 2013, 'Milwaukee Bucks'),
('Damian Lillard', 35, '6ft2', 2012, 'Milwaukee Bucks'),
('Khris Middleton', 34, '6ft7', 2012, 'Milwaukee Bucks'),
('Brook Lopez', 37, '7ft1', 2008, 'Milwaukee Bucks'),
('Bobby Portis', 30, '6ft10', 2015, 'Milwaukee Bucks'),
('Malik Beasley', 29, '6ft4', 2016, 'Milwaukee Bucks'),

('Donovan Mitchell', 29, '6ft3', 2017, 'Cleveland Cavaliers'),
('Darius Garland', 26, '6ft1', 2019, 'Cleveland Cavaliers'),
('Evan Mobley', 24, '6ft11', 2021, 'Cleveland Cavaliers'),
('Jarrett Allen', 28, '6ft11', 2017, 'Cleveland Cavaliers'),
('Caris LeVert', 30, '6ft6', 2016, 'Cleveland Cavaliers'),
('Max Strus', 29, '6ft5', 2019, 'Cleveland Cavaliers'),

('Cade Cunningham', 25, '6ft6', 2021, 'Detroit Pistons'),
('Jaden Ivey', 24, '6ft4', 2022, 'Detroit Pistons'),
('Jalen Duren', 22, '6ft10', 2022, 'Detroit Pistons'),
('Ausar Thompson', 22, '6ft7', 2023, 'Detroit Pistons'),
('Isaiah Stewart', 24, '6ft8', 2020, 'Detroit Pistons'),
('Tobias Harris', 33, '6ft8', 2011, 'Detroit Pistons'),

('Jimmy Butler', 36, '6ft7', 2011, 'Miami Heat'),
('Bam Adebayo', 29, '6ft9', 2017, 'Miami Heat'),
('Tyler Herro', 26, '6ft5', 2019, 'Miami Heat'),
('Terry Rozier', 31, '6ft1', 2015, 'Miami Heat'),
('Jaime Jaquez Jr.', 24, '6ft6', 2023, 'Miami Heat'),
('Caleb Martin', 30, '6ft5', 2019, 'Miami Heat'),

('Paolo Banchero', 23, '6ft10', 2022, 'Orlando Magic'),
('Franz Wagner', 24, '6ft10', 2021, 'Orlando Magic'),
('Jalen Suggs', 24, '6ft5', 2021, 'Orlando Magic'),
('Wendell Carter Jr.', 27, '6ft10', 2018, 'Orlando Magic'),
('Markelle Fultz', 27, '6ft4', 2017, 'Orlando Magic'),
('Gary Harris', 31, '6ft4', 2014, 'Orlando Magic'),

('Ja Morant', 26, '6ft2', 2019, 'Memphis Grizzlies'),
('Desmond Bane', 27, '6ft5', 2020, 'Memphis Grizzlies'),
('Jaren Jackson Jr.', 26, '6ft11', 2018, 'Memphis Grizzlies'),
('Marcus Smart', 32, '6ft3', 2014, 'Memphis Grizzlies'),
('Zach Edey', 23, '7ft4', 2024, 'Memphis Grizzlies'),
('Santi Aldama', 24, '6ft11', 2021, 'Memphis Grizzlies'),

('Zion Williamson', 26, '6ft6', 2019, 'New Orleans Pelicans'),
('Brandon Ingram', 28, '6ft8', 2016, 'New Orleans Pelicans'),
('CJ McCollum', 34, '6ft3', 2013, 'New Orleans Pelicans'),
('Herb Jones', 27, '6ft7', 2020, 'New Orleans Pelicans'),
('Trey Murphy III', 26, '6ft9', 2021, 'New Orleans Pelicans'),
('Jonas Valanciunas', 33, '7ft0', 2011, 'New Orleans Pelicans'),

('Victor Wembanyama', 22, '7ft4', 2023, 'San Antonio Spurs'),
('Devin Vassell', 26, '6ft5', 2020, 'San Antonio Spurs'),
('Keldon Johnson', 26, '6ft5', 2019, 'San Antonio Spurs'),
('Jeremy Sochan', 22, '6ft8', 2022, 'San Antonio Spurs'),
('Tre Jones', 26, '6ft1', 2020, 'San Antonio Spurs'),
('Chris Paul', 40, '6ft0', 2005, 'San Antonio Spurs'),

('Devin Booker', 29, '6ft5', 2015, 'Phoenix Suns'),
('Kevin Durant', 37, '6ft11', 2007, 'Phoenix Suns'),
('Bradley Beal', 32, '6ft4', 2012, 'Phoenix Suns'),
('Jusuf Nurkic', 30, '7ft0', 2014, 'Phoenix Suns'),
('Grayson Allen', 30, '6ft4', 2018, 'Phoenix Suns'),
('Eric Gordon', 37, '6ft3', 2008, 'Phoenix Suns'),

('LeBron James', 41, '6ft9', 2003, 'LA Lakers'),
('Luka Doncic', 27, '6ft8', 2018, 'LA Lakers'),
('Anthony Davis', 33, '6ft10', 2012, 'LA Lakers'),
('Austin Reaves', 27, '6ft5', 2021, 'LA Lakers'),
('Rui Hachimura', 28, '6ft8', 2019, 'LA Lakers'),
('D’Angelo Russell', 29, '6ft4', 2015, 'LA Lakers'),

('Kawhi Leonard', 34, '6ft7', 2011, 'LA Clippers'),
('Paul George', 35, '6ft8', 2010, 'LA Clippers'),
('James Harden', 36, '6ft5', 2009, 'LA Clippers'),
('Ivica Zubac', 28, '7ft1', 2016, 'LA Clippers'),
('Norman Powell', 32, '6ft4', 2015, 'LA Clippers'),
('Terance Mann', 29, '6ft5', 2019, 'LA Clippers'),

('Stephen Curry', 38, '6ft2', 2009, 'Golden State Warriors'),
('Klay Thompson', 36, '6ft6', 2011, 'Golden State Warriors'),
('Draymond Green', 35, '6ft6', 2012, 'Golden State Warriors'),
('Jonathan Kuminga', 23, '6ft8', 2021, 'Golden State Warriors'),
('Andrew Wiggins', 30, '6ft7', 2014, 'Golden State Warriors'),

('Nikola Jokic', 31, '6ft11', 2014, 'Denver Nuggets'),
('Jamal Murray', 29, '6ft4', 2016, 'Denver Nuggets'),
('Aaron Gordon', 30, '6ft8', 2014, 'Denver Nuggets'),
('Michael Porter Jr.', 27, '6ft10', 2018, 'Denver Nuggets'),
('Christian Braun', 25, '6ft6', 2022, 'Denver Nuggets'),
('Russell Westbrook', 37, '6ft3', 2008, 'Denver Nuggets'),

('Anthony Edwards', 25, '6ft4', 2020, 'Minnesota Timberwolves'),
('Karl-Anthony Towns', 30, '7ft0', 2015, 'Minnesota Timberwolves'),
('Rudy Gobert', 33, '7ft1', 2013, 'Minnesota Timberwolves'),
('Jaden McDaniels', 25, '6ft9', 2020, 'Minnesota Timberwolves'),
('Mike Conley', 38, '6ft1', 2007, 'Minnesota Timberwolves'),
('Naz Reid', 26, '6ft9', 2019, 'Minnesota Timberwolves'),

('Shai Gilgeous-Alexander', 27, '6ft6', 2018, 'Oklahoma City Thunder'),
('Chet Holmgren', 23, '7ft1', 2022, 'Oklahoma City Thunder'),
('Jalen Williams', 24, '6ft6', 2022, 'Oklahoma City Thunder'),
('Josh Giddey', 23, '6ft8', 2021, 'Oklahoma City Thunder'),
('Cason Wallace', 22, '6ft4', 2023, 'Oklahoma City Thunder'),
('Isaiah Hartenstein', 28, '7ft0', 2017, 'Oklahoma City Thunder'),

('Scoot Henderson', 22, '6ft3', 2023, 'Portland Trail Blazers'),
('Anfernee Simons', 27, '6ft3', 2018, 'Portland Trail Blazers'),
('Jerami Grant', 31, '6ft8', 2014, 'Portland Trail Blazers'),
('Deandre Ayton', 27, '7ft0', 2018, 'Portland Trail Blazers'),
('Shaedon Sharpe', 22, '6ft6', 2022, 'Portland Trail Blazers'),
('Matisse Thybulle', 28, '6ft5', 2019, 'Portland Trail Blazers'),

('Kyrie Irving', 34, '6ft2', 2011, 'Dallas Mavericks'),
('Dereck Lively II', 21, '7ft1', 2023, 'Dallas Mavericks'),
('PJ Washington', 27, '6ft7', 2019, 'Dallas Mavericks'),
('Derrick Jones Jr.', 29, '6ft6', 2016, 'Dallas Mavericks'),
('Daniel Gafford', 27, '6ft10', 2019, 'Dallas Mavericks'),

('Jalen Green', 24, '6ft4', 2021, 'Houston Rockets'),
('Alperen Sengun', 24, '6ft11', 2021, 'Houston Rockets'),
('Amen Thompson', 22, '6ft7', 2023, 'Houston Rockets'),
('Fred VanVleet', 31, '6ft0', 2016, 'Houston Rockets'),
('Jabari Smith Jr.', 23, '6ft10', 2022, 'Houston Rockets'),
('Tari Eason', 24, '6ft8', 2022, 'Houston Rockets'),

('LaMelo Ball', 25, '6ft7', 2020, 'Charlotte Hornets'),
('Brandon Miller', 24, '6ft7', 2023, 'Charlotte Hornets'),
('Miles Bridges', 29, '6ft7', 2018, 'Charlotte Hornets'),
('Mark Williams', 24, '7ft0', 2022, 'Charlotte Hornets'),
('Josh Green', 25, '6ft6', 2020, 'Charlotte Hornets'),
('Tre Mann', 25, '6ft4', 2021, 'Charlotte Hornets'),

('Lauri Markkanen', 29, '7ft0', 2017, 'Utah Jazz'),
('Walker Kessler', 24, '7ft1', 2022, 'Utah Jazz'),
('Collin Sexton', 27, '6ft1', 2018, 'Utah Jazz'),
('John Collins', 28, '6ft9', 2017, 'Utah Jazz'),
('Keyonte George', 22, '6ft4', 2023, 'Utah Jazz'),
('Jordan Clarkson', 33, '6ft4', 2014, 'Utah Jazz'),

('DeAaron Fox', 28, '6ft3', 2017, 'Sacramento Kings'),
('Domantas Sabonis', 30, '6ft11', 2016, 'Sacramento Kings'),
('Keegan Murray', 25, '6ft8', 2022, 'Sacramento Kings'),
('Malik Monk', 28, '6ft3', 2017, 'Sacramento Kings'),
('Kevin Huerter', 27, '6ft7', 2019, 'Sacramento Kings'),
('Harrison Barnes', 34, '6ft8', 2012, 'Sacramento Kings');


INSERT INTO Team (name, stadion, city) VALUES
-- EAST
('Boston Celtics', 'TD Garden', 'Boston'),
('Brooklyn Nets', 'Barclays Center', 'Brooklyn'),
('New York Knicks', 'Madison Square Garden', 'New York'),
('Philadelphia 76ers', 'Wells Fargo Center', 'Philadelphia'),
('Toronto Raptors', 'Scotiabank Arena', 'Toronto'),

('Chicago Bulls', 'United Center', 'Chicago'),
('Cleveland Cavaliers', 'Rocket Arena', 'Cleveland'),
('Detroit Pistons', 'Little Caesars Arena', 'Detroit'),
('Indiana Pacers', 'Gainbridge Fieldhouse', 'Indianapolis'),
('Milwaukee Bucks', 'Fiserv Forum', 'Milwaukee'),

('Atlanta Hawks', 'State Farm Arena', 'Atlanta'),
('Charlotte Hornets', 'Spectrum Center', 'Charlotte'),
('Miami Heat', 'Kaseya Center', 'Miami'),
('Orlando Magic', 'Kia Center', 'Orlando'),
('Washington Wizards', 'Capital One Arena', 'Washington'),

-- WEST
('Denver Nuggets', 'Ball Arena', 'Denver'),
('Minnesota Timberwolves', 'Target Center', 'Minneapolis'),
('Oklahoma City Thunder', 'Paycom Center', 'Oklahoma City'),
('Portland Trail Blazers', 'Moda Center', 'Portland'),
('Utah Jazz', 'Delta Center', 'Salt Lake City'),

('Golden State Warriors', 'Chase Center', 'San Francisco'),
('Los Angeles Lakers', 'Crypto.com Arena', 'Los Angeles'),
('LA Clippers', 'Intuit Dome', 'Inglewood'),
('Phoenix Suns', 'Footprint Center', 'Phoenix'),
('Sacramento Kings', 'Golden 1 Center', 'Sacramento'),

('Dallas Mavericks', 'American Airlines Center', 'Dallas'),
('Houston Rockets', 'Toyota Center', 'Houston'),
('San Antonio Spurs', 'Frost Bank Center', 'San Antonio'),
('Memphis Grizzlies', 'FedExForum', 'Memphis'),
('New Orleans Pelicans', 'Smoothie King Center', 'New Orleans');

INSERT INTO Player_Team (player_id,team_id,season_id,transfer_year,jersey_number) VALUES


SELECT * FROM Player_Team;
