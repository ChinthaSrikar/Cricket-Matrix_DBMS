COPY public.player_information ("Player_ID", "Player_Name", "Height", "Debut_Date", "Country_Of_Birth", "Role", "Image_Path", "Gender") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/player_information.csv' DELIMITER
',' CSV HEADER;

COPY public.awards ("Award_ID", "Player_ID", "Award_Name", "Year") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/awards_dataset.csv' DELIMITER
',' CSV HEADER;

COPY public.batting ("Player_ID", "Total_Runs_Scored", "Batting_Style") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/batting_table.csv'  DELIMITER
',' CSV HEADER;

COPY public.bowling ("Player_ID", "Wickets_Taken", "Bowling_Style") FROM  'D:/Spring_2024/DMQL/Final_Project/Table_data/bowling_table.csv' DELIMITER
',' CSV HEADER;

COPY public.city ("Player_ID", "City_Of_Birth") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/city_dataset.csv'  DELIMITER
',' CSV HEADER;

COPY public.ipl_format ("Player_ID", "IPL_Runs", "IPL_Wickets") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/ipl_format_data.csv' DELIMITER
',' CSV HEADER;

COPY public.odi_format ("Player_ID", "ODI_Runs", "ODI_Wickets") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/odi_format_data.csv' DELIMITER
',' CSV HEADER;

COPY public.player_endorsements ("Endorsement_ID", "Player_ID", "Brand_Name", "Deal_Value") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/players_endorsements.csv' DELIMITER
',' CSV HEADER;

COPY public.t20_format ("Player_ID", "T20_Runs", "T20_Wickets") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/t20_format_data.csv' DELIMITER
',' CSV HEADER;

COPY public.teams ("Team_ID", "Team_Name", "Coach_Name", "Player_ID") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/teams_coach_assigned.csv' DELIMITER
',' CSV HEADER;

COPY public.test_format ("Player_ID", "Test_Runs", "Test_Wickets") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/test_format_data.csv' DELIMITER
',' CSV HEADER;

COPY public.team_rankings ("Team_Name", "ODI_ranking", "Test_Ranking", "T20_Ranking") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/team_rankings_dataset.csv' DELIMITER
',' CSV HEADER;

COPY public.international_ranking ("Player_ID", "Format", "Rank") FROM 'D:/Spring_2024/DMQL/Final_Project/Table_data/international_ranking_dataset.csv' DELIMITER
',' CSV HEADER;
