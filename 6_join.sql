-- # 1. Show matchid and player name for all goals scored by
-- # Germany. teamid = 'GER'.

SELECT matchid, player
FROM euro2012.goal
WHERE teamid = 'GER';

-- # 2. Show id, stadium, team1, team2 for game 1012.

SELECT id, stadium, team1, team2
FROM euro2012.game
WHERE id = 1012;

-- # 3. Show the player, teamid and mdate and for every German
-- # goal. teamid='GER'.

SELECT goal.player, goal.teamid, game.mdate
FROM euro2012.goal
JOIN euro2012.game
ON goal.matchid = game.id
WHERE goal.teamid = 'GER';

-- # 4. Show the team1, team2 and player for every goal scored by a
-- # player called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player
FROM euro2012.game
JOIN euro2012.goal
ON game.id = goal.matchid
WHERE goal.player LIKE 'Mario%';

-- # 5. Show player, teamid, coach, gtime for all goals scored in the
-- # first 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM euro2012.goal
JOIN euro2012.game
ON goal.matchid = game.id
JOIN euro2012.eteam
ON game.team1 = eteam.id
WHERE goal.gtime <= 10;

-- # 6. List the the dates of the matches and the name of the team in
-- # which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM euro2012.game
JOIN euro2012.eteam
ON game.team1 = eteam.id
WHERE eteam.coach = 'Fernando Santos';

-- # 7. List the player for every goal scored in a game where the
-- # staium was 'National Stadium, Warsaw'
SELECT goal.player
FROM euro2012.goal
JOIN euro2012.game
ON goal.matchid = game.id
WHERE game.stadium = 'National Stadium, Warsaw';

-- # 8. Show names of all players who scored a goal against Germany.
SELECT DISTINCT goal.player
FROM euro2012.goal
JOIN euro2012.game
ON goal.matchid = game.id
WHERE (game.team1 = 'GER' OR game.team2 = 'GER') 
AND goal.teamid != 'GER';

-- # 9. Show teamname and the total number of goals scored.
SELECT eteam.teamname, COUNT(goal.player) AS total_goals
FROM euro2012.goal
JOIN euro2012.eteam
ON goal.teamid = eteam.id
GROUP BY eteam.teamname;

-- # 10. Show the stadium and the number of goals scored in each
-- # stadium.
SELECT game.stadium, COUNT(goal.player) AS total_goals
FROM euro2012.goal
JOIN euro2012.game
ON goal.matchid = game.id
GROUP BY game.stadium;

-- # 11. For every match involving 'POL', show the matchid, date and
-- # the number of goals scored.
SELECT game.id AS matchid, game.mdate, COUNT(goal.player) AS total_goals
FROM euro2012.game
LEFT JOIN euro2012.goal
ON game.id = goal.matchid
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY game.id, game.mdate;

-- # 12. For every match where 'GER' scored, show matchid, match date
-- # and the number of goals scored by 'GER'
SELECT game.id AS matchid, game.mdate, COUNT(goal.player) AS total_goals
FROM euro2012.game
JOIN euro2012.goal
ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY game.id, game.mdate;
-- # 13. List every match with the goals scored by each team as shown.

