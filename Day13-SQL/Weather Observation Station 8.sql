
SELECT DISTINCT CITY From STATION where lower (substr(CITY,1,1)) IN ('a', 'e', 'i','o','u') AND lower(substr(CITY, LENGTH(CITY),1)) IN ('a','e','i','o','u');
