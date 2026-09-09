SELECT DECIMAL(ROUND(AVG(LAT_N), 4), 20, 4)
FROM (
    SELECT LAT_N,
           ROW_NUMBER() OVER (ORDER BY LAT_N) AS RN,
           COUNT(*) OVER () AS CNT
    FROM STATION
) AS T
WHERE RN IN (
    (CNT + 1) / 2,
    (CNT + 2) / 2
);