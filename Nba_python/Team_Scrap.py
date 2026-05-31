"""
Print team tuples in the format:
('Atlanta Hawks', 'State Farm Arena', 'Atlanta'),

This uses the provided static mapping (stadium names and cities) and prints each tuple.
"""

teams_list = [
    ('Atlanta Hawks', 'State Farm Arena', 'Atlanta'),
    ('Boston Celtics', 'TD Garden', 'Boston'),
    ('Cleveland Cavaliers', 'Rocket Arena', 'Cleveland'),
    ('New Orleans Pelicans', 'Smoothie King Center', 'New Orleans'),
    ('Chicago Bulls', 'United Center', 'Chicago'),
    ('Dallas Mavericks', 'American Airlines Center', 'Dallas'),
    ('Denver Nuggets', 'Ball Arena', 'Denver'),
    ('Golden State Warriors', 'Chase Center', 'San Francisco'),
    ('Houston Rockets', 'Toyota Center', 'Houston'),
    ('LA Clippers', 'Intuit Dome', 'Inglewood'),
    ('Los Angeles Lakers', 'Crypto.com Arena', 'Los Angeles'),
    ('Miami Heat', 'Kaseya Center', 'Miami'),
    ('Milwaukee Bucks', 'Fiserv Forum', 'Milwaukee'),
    ('Minnesota Timberwolves', 'Target Center', 'Minneapolis'),
    ('Brooklyn Nets', 'Barclays Center', 'Brooklyn'),
    ('New York Knicks', 'Madison Square Garden', 'New York'),
    ('Orlando Magic', 'Kia Center', 'Orlando'),
    ('Indiana Pacers', 'Gainbridge Fieldhouse', 'Indianapolis'),
    ('Philadelphia 76ers', 'Wells Fargo Center', 'Philadelphia'),
    ('Phoenix Suns', 'Footprint Center', 'Phoenix'),
    ('Portland Trail Blazers', 'Moda Center', 'Portland'),
    ('Sacramento Kings', 'Golden 1 Center', 'Sacramento'),
    ('San Antonio Spurs', 'Frost Bank Center', 'San Antonio'),
    ('Oklahoma City Thunder', 'Paycom Center', 'Oklahoma City'),
    ('Toronto Raptors', 'Scotiabank Arena', 'Toronto'),
    ('Utah Jazz', 'Delta Center', 'Salt Lake City'),
    ('Memphis Grizzlies', 'FedExForum', 'Memphis'),
    ('Washington Wizards', 'Capital One Arena', 'Washington'),
    ('Detroit Pistons', 'Little Caesars Arena', 'Detroit'),
    ('Charlotte Hornets', 'Spectrum Center', 'Charlotte'),
]

if __name__ == '__main__':
    for team_name, stadium, city in teams_list:
        print(f"('{team_name}', '{stadium}', '{city}'),")