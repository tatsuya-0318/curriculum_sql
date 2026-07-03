-- 問1
SELECT
    uniform_num,
    name,
    club
FROM players;

-- 問2
SELECT *
FROM countries
WHERE group_name = 'C';

-- 問3
SELECT *
FROM countries
WHERE group_name <> 'C';

-- 問4
SELECT *
FROM players
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, birth)) >= 40;

-- 問5
SELECT *
FROM players
WHERE height < 170;

-- 問6
SELECT *
FROM countries
WHERE ranking BETWEEN 36 AND 56;