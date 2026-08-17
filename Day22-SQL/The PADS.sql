SELECT name || '(' || SUBSTR(occupation, 1, 1) || ')'
FROM OCCUPATIONS
ORDER BY name ASC;

SELECT 'There are a total of ' || COUNT(*) || ' ' ||
       LOWER(occupation) || 's.'
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY COUNT(*) ASC, occupation ASC;
