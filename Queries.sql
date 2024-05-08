
-- Inserting a new player record into the table
INSERT INTO player_information("Player_ID", "Player_Name",
							   "Height", "Debut_Date", "Country_Of_Birth", 
							   "Role", "Image_Path", "Gender")
VALUES (17386, 'Pavan', 175, '1998-11-15', 'India',
		'Batsman', 'https://cdn.sportmonks.com/images/cricket/placeholder.png', 'm');


Select * from player_information where "Player_ID"=17386;

-- Inserting new row into batting table
INSERT INTO batting("Player_ID", "Total_Runs_Scored", "Batting_Style") 
VALUES (17386, 7075, 'right-hand-bat');

Select * from batting where "Player_ID"=17386;

-- Query to update the Wickets_Taken
UPDATE bowling 
SET "Wickets_Taken" = 560 
WHERE "Player_ID" = 300;

Select * from bowling where "Player_ID"=300;

-- Query to update the coach name
UPDATE teams 
SET "Coach_Name" = 'Tom Moody' 
WHERE "Team_ID" = 10;

Select * from teams where "Team_ID"=10;

-- Query to delete rows from the endorsements table which satisfy the condition
DELETE FROM player_endorsements 
WHERE "Brand_Name" IS NULL;

select * from player_endorsements where "Brand_Name" IS NULL;

-- Query to select top 10 batting performances
SELECT * FROM batting
ORDER BY "Total_Runs_Scored" DESC
LIMIT 10;


-- Query to get the count of players from each country
SELECT "Country_Of_Birth", COUNT(*) AS "Num_Players"
FROM player_information
GROUP BY "Country_Of_Birth";

-- Query to get the names and their debut date
-- who won the Player of the Year Award (Nested Query)
SELECT "Player_Name", "Debut_Date"
FROM player_information
WHERE "Player_ID" IN 
    (SELECT "Player_ID" 
     FROM awards 
     WHERE "Award_Name" = 'Player of the Year');


-- Query to get the name, award received, and the team of the player
SELECT p."Player_Name", a."Award_Name", t."Team_Name"
FROM player_information p
JOIN awards a ON p."Player_ID" = a."Player_ID"
JOIN teams t ON p."Player_ID" = t."Player_ID";


-- Query to get the city of birth of the players where the count is greater than 5
SELECT c."City_Of_Birth", COUNT(*) AS "Num_Players"
FROM player_information p
JOIN city c ON p."Player_ID" = c."Player_ID"
GROUP BY c."City_Of_Birth"
HAVING COUNT(*) > 5;

-- Query to get the player name and the endorsement deal
SELECT p."Player_Name", pe."Deal_Value", e."Brand_Name"
FROM player_information p
JOIN player_endorsements pe ON p."Player_ID" = pe."Player_ID"
JOIN player_endorsements e ON pe."Endorsement_ID" = e."Endorsement_ID"
ORDER BY pe."Deal_Value" DESC, p."Player_Name" ASC;


-- Query to select the best player
SELECT 
    pi."Player_Name",
    SUM(b."Total_Runs_Scored") AS "Total_Runs",
    SUM(bw."Wickets_Taken") AS "Total_Wickets"
FROM 
    player_information pi
LEFT JOIN 
    batting b ON pi."Player_ID" = b."Player_ID"
LEFT JOIN 
    bowling bw ON pi."Player_ID" = bw."Player_ID"
GROUP BY 
    pi."Player_ID", pi."Player_Name"
ORDER BY 
    "Total_Runs" DESC, "Total_Wickets" DESC
LIMIT 1;





























