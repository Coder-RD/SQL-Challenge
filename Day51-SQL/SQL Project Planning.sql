SELECT MIN(Start_Date), MAX(End_Date)
FROM
(
    SELECT Start_Date, End_Date,
           SUM(New_Project) OVER (ORDER BY Start_Date) AS Project_Group
    FROM
    (
        SELECT Start_Date, End_Date,
               CASE
                   WHEN LAG(End_Date) OVER (ORDER BY Start_Date) = Start_Date
                   THEN 0
                   ELSE 1
               END AS New_Project
        FROM Projects
    ) AS A
) AS B
GROUP BY Project_Group
ORDER BY 
    DAYS(MAX(End_Date)) - DAYS(MIN(Start_Date)),
    MIN(Start_Date);