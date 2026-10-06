SELECT 
    m.match_id, 
    m.player_1, 
    m.player_2, 
    m.winner, 
    m.match_date, 
    p.score
FROM Matches m
JOIN Players p 
    ON m.winner = p.player_name
ORDER BY m.match_date DESC
LIMIT 5;