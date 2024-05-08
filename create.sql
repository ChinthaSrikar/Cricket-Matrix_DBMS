--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: awards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.awards (
    "Award_ID" integer NOT NULL,
    "Player_ID" integer NOT NULL,
    "Award_Name" character varying,
    "Year" integer
);


--
-- Name: batting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.batting (
    "Player_ID" integer NOT NULL,
    "Total_Runs_Scored" integer NOT NULL,
    "Batting_Style" character varying
);


--
-- Name: bowling; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bowling (
    "Player_ID" integer NOT NULL,
    "Wickets_Taken" integer NOT NULL,
    "Bowling_Style" character varying
);


--
-- Name: city; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city (
    "Player_ID" integer NOT NULL,
    "City_Of_Birth" character varying
);


--
-- Name: international_ranking; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.international_ranking (
    "Player_ID" integer NOT NULL,
    "Format" character varying NOT NULL,
    "Rank" integer
);


--
-- Name: ipl_format; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ipl_format (
    "Player_ID" integer NOT NULL,
    "IPL_Runs" integer,
    "IPL_Wickets" integer
);


--
-- Name: odi_format; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.odi_format (
    "Player_ID" integer NOT NULL,
    "ODI_Runs" integer,
    "ODI_Wickets" integer
);


--
-- Name: player_endorsements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_endorsements (
    "Endorsement_ID" integer NOT NULL,
    "Player_ID" integer NOT NULL,
    "Brand_Name" character varying,
    "Deal_Value" integer
);


--
-- Name: player_information; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.player_information (
    "Player_ID" integer NOT NULL,
    "Player_Name" character varying NOT NULL,
    "Height" character varying NOT NULL,
    "Debut_Date" date NOT NULL,
    "Country_Of_Birth" character varying NOT NULL,
    "Role" character varying NOT NULL,
    "Image_Path" character varying,
    "Gender" character varying
);


--
-- Name: t20_format; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.t20_format (
    "Player_ID" integer NOT NULL,
    "T20_Runs" integer,
    "T20_Wickets" integer
);


--
-- Name: team_rankings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.team_rankings (
    "Team_Name" character varying NOT NULL,
    "ODI_ranking" double precision NOT NULL,
    "Test_Ranking" double precision NOT NULL,
    "T20_Ranking" double precision NOT NULL
);


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    "Team_ID" integer NOT NULL,
    "Team_Name" character varying,
    "Coach_Name" character varying,
    "Player_ID" integer NOT NULL
);


--
-- Name: test_format; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.test_format (
    "Player_ID" integer NOT NULL,
    "Test_Runs" integer,
    "Test_Wickets" integer
);


--
-- Name: awards Awards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT "Awards_pkey" PRIMARY KEY ("Award_ID", "Player_ID");


--
-- Name: player_endorsements Player_Endorsements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_endorsements
    ADD CONSTRAINT "Player_Endorsements_pkey" PRIMARY KEY ("Endorsement_ID", "Player_ID");


--
-- Name: player_information Player_Information_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_information
    ADD CONSTRAINT "Player_Information_pkey" PRIMARY KEY ("Player_ID");


--
-- Name: international_ranking international_ranking_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.international_ranking
    ADD CONSTRAINT international_ranking_pkey PRIMARY KEY ("Player_ID", "Format");


--
-- Name: team_rankings team_rankings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.team_rankings
    ADD CONSTRAINT team_rankings_pkey PRIMARY KEY ("Team_Name");


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY ("Team_ID", "Player_ID");


--
-- Name: idx_player_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_player_id ON public.player_information USING btree ("Player_ID") WITH (deduplicate_items='true');


--
-- Name: awards Awards_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT "Awards_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: batting Batting_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.batting
    ADD CONSTRAINT "Batting_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: ipl_format IPL_Format_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ipl_format
    ADD CONSTRAINT "IPL_Format_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: player_endorsements Player_Endorsements_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.player_endorsements
    ADD CONSTRAINT "Player_Endorsements_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: bowling bowling_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bowling
    ADD CONSTRAINT "bowling_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: city city_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "city_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: international_ranking international_ranking_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.international_ranking
    ADD CONSTRAINT "international_ranking_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: odi_format odi_format_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.odi_format
    ADD CONSTRAINT "odi_format_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: t20_format t20_format_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.t20_format
    ADD CONSTRAINT "t20_format_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: teams teams_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "teams_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- Name: test_format test_format_Player_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.test_format
    ADD CONSTRAINT "test_format_Player_ID_fkey" FOREIGN KEY ("Player_ID") REFERENCES public.player_information("Player_ID");


--
-- PostgreSQL database dump complete
--

