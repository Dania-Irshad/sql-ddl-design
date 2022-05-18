DROP DATABASE IF EXISTS  soccer_league;
CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  team TEXT NOT NULL
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams ON DELETE SET NULL,
  name TEXT NOT NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE seasons
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    referee_id INTEGER REFERENCES referees ON DELETE SET NULL,
    season_id INTEGER REFERENCES seasons ON DELETE SET NULL,
    team_one INTEGER REFERENCES teams ON DELETE SET NULL,
    team_two INTEGER REFERENCES teams ON DELETE SET NULL,
    team_one_goals INTEGER,
    team_two_goals INTEGER
);

CREATE TABLE gaols
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    game_id INTEGER REFERENCES games ON DELETE CASCADE,
    goals INTEGER NOT NULL
);
