CREATE DATABASE NBA;


CREATE TABLE Team(

	ID SERIAL PRIMARY KEY,
	Name CHAR(30),
	Stadion CHAR(30),
	City CHAR(30)
);

CREATE TABLE Player(

	ID SERIAL PRIMARY KEY,
	Name CHAR(30),
	Age INT,
	Height CHAR(30), /*Možemo stavit i int pa da budu cm ali znam da ste govorili da zelite u stopama pa nek bude char osim ako imate bolju ideju*/
	Draft_Year INT
);

CREATE TABLE Season(
	
	ID SERIAL PRIMARY KEY,
	Year INT
);

CREATE TABLE Player_Team(

	ID SERIAL PRIMARY KEY,
	Player_ID INT references Player(ID),
	Team_ID INT references Team(ID),
	Season_ID INT references Season(ID),
	Transfer_Date DATE,
	Jersey_Number INT

);

CREATE TABLE Matches(

	ID SERIAL PRIMARY KEY,
	Home_Team_ID INT references Team(ID),
	Away_Team_ID INT references Team(ID),
	Season_ID INT references Season(ID),
	Date DATE,
	Result CHAR(11)
	
);

CREATE TABLE Standings(

	ID SERIAL PRIMARY KEY,
	Season_ID INT references Season(ID),
	Team_ID INT references Team(ID),
	Position INT,
	Games_Played INT,
	Won INT,
	Lost INT,
	Average_win_lost NUMERIC(5,2)

);

CREATE TABLE Player_Game(

	ID SERIAL PRIMARY KEY,
	Player_ID INT references Player(ID),
	Match_ID INT references Matches(ID)
);

CREATE TABLE Player_Stats(

	ID SERIAL PRIMARY KEY,
	Player_match INT references Player_Game(ID)
	Season_ID INT references Season(ID),
	Avg_Points NUMERIC(5,2),
	Avg_Assists NUMERIC(5,2),
	Avg_Rebounds NUMERIC(5,2),
	Avg_Fouls NUMERIC(5,2),
	Avg_Blocks NUMERIC(5,2),
	Games_Played INT,
	/*Promjenit tako da je postotak*/
	Free_Throw_Points_PCT INT,
	Two_Point_PCT INT,
	Three_Point_PCT INT
	
);

CREATE TABLE Player_Match_Stats(

	ID Serial PRIMARY KEY,
	Season_ID INT references Season(ID),
	Blocks INT,
	Points INT,
	Assists INT,
	Rebounds INT,
	Fouls INT,
	Free_Throw INT,
	Free_Throw_Shots INT,
	Two_Point INT,
	Two_Point_Shots INT,
	Three_Point INT
	Three_Point_Shots INT

);

DROP TABLE player_stats

SELECT * FROM Season

INSERT INTO Season (Year) VALUES
(2024), (2025), (2026);

DELETE FROM Season;


























