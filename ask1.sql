SELECT player_name, height, weight FROM Player WHERE height>=160 AND height<180 ORDER BY weight DESC;
SELECT date, home_team_api_id, home_team_goal FROM Match WHERE match_api_id=492480;
SELECT DISTINCT Team.team_long_name, Country.name FROM Team JOIN Match JOIN Country ON Team.team_api_id=Match.home_team_api_id AND Match.country_id=Country.id;
SELECT date, home_team_api_id, home_team_goal, away_team_api_id, away_team_goal FROM Match WHERE match_api_id=492480;