SELECT DECIMAL(
    SQRT(
        (MAX(LAT_N) - MIN(LAT_N)) * (MAX(LAT_N) - MIN(LAT_N))
        +
        (MAX(LONG_W) - MIN(LONG_W)) * (MAX(LONG_W) - MIN(LONG_W))
    ),
    10, 4
)
FROM STATION;
