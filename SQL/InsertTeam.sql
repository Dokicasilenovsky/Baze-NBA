/*Neka na pocetku stoji ovo za brisanje tablica tako da ne moramo pamtit sta je stavljeno sta je novo nego svaki put izbrise prije stavljanja svih podataka ispocetka*/
TRUNCATE TABLE Team RESTART IDENTITY CASCADE; 

INSERT INTO Team (name, stadion, city,conference) VALUES
('Atlanta Hawks', 'State Farm Arena', 'Atlanta','Eastern'),
('Boston Celtics', 'TD Garden', 'Boston','Eastern'),
('Cleveland Cavaliers', 'Rocket Arena', 'Cleveland','Eastern'),
('New Orleans Pelicans', 'Smoothie King Center', 'New Orleans','Western'),
('Chicago Bulls', 'United Center', 'Chicago','Eastern'),
('Dallas Mavericks', 'American Airlines Center', 'Dallas','Western'),
('Denver Nuggets', 'Ball Arena', 'Denver', 'Western'),
('Golden State Warriors', 'Chase Center', 'San Francisco','Western'),
('Houston Rockets', 'Toyota Center', 'Houston', 'Western'),
('LA Clippers', 'Intuit Dome', 'Inglewood','Western'),
('Los Angeles Lakers', 'Crypto.com Arena', 'Los Angeles','Western'),
('Miami Heat', 'Kaseya Center', 'Miami','Eastern'),
('Milwaukee Bucks', 'Fiserv Forum', 'Milwaukee','Eastern'),
('Minnesota Timberwolves', 'Target Center', 'Minneapolis','Western'),
('Brooklyn Nets', 'Barclays Center', 'Brooklyn','Eastern'),
('New York Knicks', 'Madison Square Garden', 'New York','Eastern'),
('Orlando Magic', 'Kia Center', 'Orlando','Eastern'),
('Indiana Pacers', 'Gainbridge Fieldhouse', 'Indianapolis','Eastern'),
('Philadelphia 76ers', 'Wells Fargo Center', 'Philadelphia','Eastern'),
('Phoenix Suns', 'Footprint Center', 'Phoenix','Western'),
('Portland Trail Blazers', 'Moda Center', 'Portland','Western'),
('Sacramento Kings', 'Golden 1 Center', 'Sacramento','Western'),
('San Antonio Spurs', 'Frost Bank Center', 'San Antonio','Western'),
('Oklahoma City Thunder', 'Paycom Center', 'Oklahoma City','Western'),
('Toronto Raptors', 'Scotiabank Arena', 'Toronto','Eastern'),
('Utah Jazz', 'Delta Center', 'Salt Lake City','Western'),
('Memphis Grizzlies', 'FedExForum', 'Memphis','Western'),
('Washington Wizards', 'Capital One Arena', 'Washington','Eastern'),
('Detroit Pistons', 'Little Caesars Arena', 'Detroit','Eastern'),
('Charlotte Hornets', 'Spectrum Center', 'Charlotte','Eastern');


SELECT * FROM Team;
