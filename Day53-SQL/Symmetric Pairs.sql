
SELECT X, Y
FROM Functions
WHERE X < Y
  AND (Y, X) IN (
      SELECT X, Y
      FROM Functions
  )

UNION

SELECT X, Y
FROM Functions
WHERE X = Y
GROUP BY X, Y
HAVING COUNT(*) > 1

ORDER BY X, Y;