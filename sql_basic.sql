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

-- 問7
SELECT *
FROM players
WHERE position IN ('GK', 'DF', 'MF');

-- 問8
SELECT *
FROM goals
WHERE player_id IS NULL;

-- 問9
SELECT *
FROM goals
WHERE player_id IS NOT NULL;

-- 問10
SELECT *
FROM players
WHERE name LIKE '%ニョ';

-- 問11
SELECT *
FROM players
WHERE name LIKE '%ニョ%';

-- 問12
SELECT *
FROM players
WHERE height < 165
OR weight < 60;

-- 問13
SELECT *
FROM players
WHERE (position = 'FW' OR position = 'MF')
AND height < 170;

-- 問14
SELECT DISTINCT position
FROM players;

-- 問15
SELECT
    name,
    club,
    height + weight AS "体力指数"
FROM players;

-- 問16
SELECT *
FROM players
ORDER BY height DESC, weight DESC;

-- 問17
SELECT
    id,
    pairing_id,
    CASE
        WHEN player_id IS NULL THEN 9999
        ELSE player_id
    END AS player_id,
    goal_time
FROM goals;

-- 問18
SELECT
    AVG(height) AS "平均身長",
    AVG(weight) AS "平均体重"
FROM players;