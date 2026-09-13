
SELECT h.hacker_id,
       h.name,
       COUNT(c.challenge_id) AS total_challenges
FROM Hackers h
JOIN Challenges c
    ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING COUNT(c.challenge_id) = (
    SELECT MAX(challenge_count)
    FROM (
        SELECT COUNT(*) AS challenge_count
        FROM Challenges
        GROUP BY hacker_id
    ) AS counts
)
OR COUNT(c.challenge_id) IN (
    SELECT challenge_count
    FROM (
        SELECT COUNT(*) AS challenge_count
        FROM Challenges
        GROUP BY hacker_id
    ) AS counts
    GROUP BY challenge_count
    HAVING COUNT(*) = 1
)
ORDER BY total_challenges DESC, h.hacker_id;
