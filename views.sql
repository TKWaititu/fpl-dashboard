DROP VIEW IF EXISTS "main"."player_points_history";
CREATE VIEW "player_points_history" AS SELECT 
	pp.*,
	t.name
FROM players as p
JOIN player_points as pp
	on p.player_id = pp.player_id
JOIN teams as t
	on p.team = t.team_id
	
	DROP VIEW IF EXISTS "main"."player_upcoming_fixtures";
CREATE VIEW "player_upcoming_fixtures" AS SELECT
    p.player_id,
    p.player_name,
	p.current_cost,
    f.status,
	f.event,
	f.kickoff_time,
    f.team_difficulty,
    t1.name AS team_name,
    t2.name AS opponent_name
FROM fixtures AS f
JOIN teams AS t1 
    ON f.team_id = t1.team_id
JOIN teams AS t2 
    ON f.opponent_id = t2.team_id
JOIN players AS p
    ON t1.team_id = p.team
	WHERE f.finished = 0
	DROP VIEW IF EXISTS "main"."teams_upcoming_fixtures";
CREATE VIEW "teams_upcoming_fixtures" AS SELECT
	t1.name AS team_name,
    t2.name AS opponent_name,
    f.status,
	f.kickoff_time,
    f.team_difficulty    
FROM fixtures AS f
JOIN teams AS t1 
    ON f.team_id = t1.team_id
JOIN teams AS t2 
    ON f.opponent_id = t2.team_id
	WHERE f.finished = 0