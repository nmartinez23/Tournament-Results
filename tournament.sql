-- Table definitions for the tournament project.
--
-- Drop db first to save time when running and testing app during development
DROP DATABASE tournament;
-- Recreate db to run and test app
CREATE DATABASE tournament;
-- Connect to tournament db
\c tournament;

CREATE TABLE players ( id SERIAL PRIMARY KEY, name TEXT);

CREATE TABLE matches ( id SERIAL PRIMARY KEY,
                       winner INTEGER REFERENCES players (id),
                       loser INTEGER REFERENCES players (id));

-- Views created for the reportMatch and playerStandings methods
CREATE VIEW losses AS SELECT players.id AS ID, coalesce(count(loser),0)
AS total_losses FROM players LEFT JOIN matches ON players.id = matches.loser
GROUP BY players.id ORDER BY total_losses DESC;

CREATE VIEW wins AS SELECT players.id AS ID, coalesce(count(winner),0)
AS total_wins FROM players LEFT JOIN matches ON players.id = matches.winner
GROUP BY players.id ORDER BY total_wins DESC;

CREATE VIEW standings AS SELECT wins.ID AS ID, name, wins.total_wins
AS total_wins, losses.total_losses + wins.total_wins AS matches FROM
players, losses, wins WHERE players.ID = wins.ID AND losses.ID = wins.ID
ORDER BY total_wins DESC;
