WITH Ranked AS
(
    SELECT
        Name,
        Occupation,
        ROW_NUMBER() OVER
        (
            PARTITION BY Occupation
            ORDER BY Name
        ) AS rn
    FROM OCCUPATIONS
)
SELECT
    COALESCE(MAX(CASE WHEN Occupation = 'Doctor' THEN Name END), 'NULL') AS Doctor,
    COALESCE(MAX(CASE WHEN Occupation = 'Professor' THEN Name END), 'NULL') AS Professor,
    COALESCE(MAX(CASE WHEN Occupation = 'Singer' THEN Name END), 'NULL') AS Singer,
    COALESCE(MAX(CASE WHEN Occupation = 'Actor' THEN Name END), 'NULL') AS Actor
FROM Ranked
GROUP BY rn
ORDER BY rn;