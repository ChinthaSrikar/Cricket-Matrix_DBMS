
--Problematic Queries

---Query 1
SELECT pi."Player_Name", pe."Brand_Name", pe."Deal_Value"
FROM player_information pi
JOIN player_endorsements pe ON pi."Player_ID" = pe."Player_ID"
WHERE pe."Deal_Value" > 99500
ORDER BY pe."Deal_Value" DESC;


CREATE INDEX idx_deal_value ON player_endorsements ("Deal_Value" DESC);



--Query 2

SELECT pi."Player_Name", MAX(tf."Test_Runs")
FROM player_information pi
JOIN test_format tf ON pi."Player_ID" = tf."Player_ID"
WHERE pi."Country_Of_Birth" = 'India'
GROUP BY pi."Player_Name";


CREATE INDEX idx_city_of_birth ON player_information ("Country_Of_Birth");
CREATE INDEX idx_player_id_test ON test_format ("Player_ID");


--Query 3
SELECT pi."Player_Name", MAX(tf."Test_Runs")
FROM player_information pi
JOIN test_format tf ON pi."Player_ID" = tf."Player_ID"
WHERE pi."Country_Of_Birth" = 'India'
GROUP BY pi."Player_Name";


CREATE VIEW player_career_statistics AS
SELECT p."Player_ID", p."Player_Name",
       SUM(t."Test_Runs") AS "Total_Test_Runs", 
	   SUM(o."ODI_Runs") AS "Total_ODI_Runs", 
	   SUM(t20."T20_Runs") AS "Total_T20_Runs"
FROM player_information p
LEFT JOIN test_format t ON p."Player_ID" = t."Player_ID"
LEFT JOIN odi_format o ON p."Player_ID" = o."Player_ID"
LEFT JOIN t20_format t20 ON p."Player_ID" = t20."Player_ID"
GROUP BY p."Player_ID", p."Player_Name";

SELECT *
FROM player_career_statistics;