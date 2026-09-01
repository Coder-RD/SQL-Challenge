SELECT ROUND(
    DECIMAL(
        ABS(MAX(LAT_N) - MIN(LAT_N)) +
        ABS(MAX(LONG_W) - MIN(LONG_W)),
        20,
        4
    ),
    4
)
FROM STATION;