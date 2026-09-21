WITH DAILY_SUBMISSIONS AS (
    SELECT
        submission_date,
        hacker_id,
        COUNT(*) AS submission_count
    FROM Submissions
    WHERE submission_date BETWEEN DATE('2016-03-01')
                              AND DATE('2016-03-15')
    GROUP BY submission_date, hacker_id
),

DAILY_WINNER AS (
    SELECT
        submission_date,
        hacker_id,
        submission_count,
        ROW_NUMBER() OVER (
            PARTITION BY submission_date
            ORDER BY submission_count DESC, hacker_id ASC
        ) AS rn
    FROM DAILY_SUBMISSIONS
),

CONSISTENT_HACKERS AS (
    SELECT
        s1.submission_date,
        COUNT(DISTINCT s1.hacker_id) AS unique_hackers
    FROM Submissions s1
    WHERE s1.submission_date BETWEEN DATE('2016-03-01')
                                  AND DATE('2016-03-15')
      AND (
          SELECT COUNT(DISTINCT s2.submission_date)
          FROM Submissions s2
          WHERE s2.hacker_id = s1.hacker_id
            AND s2.submission_date BETWEEN DATE('2016-03-01')
                                       AND s1.submission_date
      )
      =
      (DAYS(s1.submission_date) - DAYS(DATE('2016-03-01')) + 1)
    GROUP BY s1.submission_date
)

SELECT
    w.submission_date,
    c.unique_hackers,
    w.hacker_id,
    h.name
FROM DAILY_WINNER w
JOIN CONSISTENT_HACKERS c
    ON w.submission_date = c.submission_date
JOIN Hackers h
    ON w.hacker_id = h.hacker_id
WHERE w.rn = 1
ORDER BY w.submission_date;