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

-- 問19
SELECT
    COUNT(*) AS "ゴール数"
FROM goals
WHERE player_id BETWEEN 714 AND 736;

-- 問20
SELECT
    MAX(height) AS "最も高い身長",
    MIN(weight) AS "最も軽い体重"
FROM players;

-- 問21
SELECT
    SUM(ranking) AS "FIFAランク合計"
FROM countries
WHERE group_name = 'C';

-- 問22
SELECT
    countries.name,
    players.name,
    goals.goal_time
FROM goals
INNER JOIN players
    ON goals.player_id = players.id
INNER JOIN countries
    ON players.country_id = countries.id;

-- 問23
SELECT
    goals.goal_time,
    players.name
FROM goals
LEFT JOIN players
ON goals.player_id = players.id;

-- 問24
SELECT
    goals.goal_time,
    players.name
FROM players
RIGHT JOIN goals
ON players.id = goals.player_id;

-- 問25
SELECT
    goals.goal_time,
    players.name,
    countries.name
FROM goals
LEFT JOIN players
ON goals.player_id = players.id
LEFT JOIN countries
ON players.country_id = countries.id;

-- 問26
SELECT
    goal_time,
    (
        SELECT name
        FROM players
        WHERE players.id = goals.player_id
    ) AS name
FROM goals
WHERE player_id IS NOT NULL;

-- 問27
SELECT
    players.position,
    players.name,
    players.club,
    players.height
FROM players
INNER JOIN (
    SELECT
        position,
        MAX(height) AS max_height
    FROM players
    GROUP BY position
) AS max_players
ON players.position = max_players.position
AND players.height = max_players.max_height;

-- 問28
SELECT
    group_name,
    MIN(ranking) AS "最上位",
    MAX(ranking) AS "最下位",
    MAX(ranking) - MIN(ranking) AS "差"
FROM countries
GROUP BY group_name
HAVING MAX(ranking) - MIN(ranking) > 50;

-- 問29
SELECT
    '1980年生まれ' AS "生まれ年",
    COUNT(*) AS "人数"
FROM players
WHERE CAST(birth AS TEXT) LIKE '1980%'

UNION

SELECT
    '1981年生まれ' AS "生まれ年",
    COUNT(*) AS "人数"
FROM players
WHERE CAST(birth AS TEXT) LIKE '1981%';

-- 問30
SELECT *
FROM players
WHERE height > 195

UNION ALL

SELECT *
FROM players
WHERE weight > 95

ORDER BY id;

-- 問31
SELECT
    name,
    height,
    weight
FROM players
ORDER BY height DESC, name ASC
LIMIT 15 OFFSET 5;

-- 問32
SELECT
    pairings.kickoff,
    my_countries.name AS "自国名",
    enemy_countries.name AS "対戦相手国名",
    my_countries.ranking AS "自国FIFAランク",
    enemy_countries.ranking AS "対戦相手国FIFAランク",
    COUNT(goals.id) AS "自国のゴール数"
FROM pairings
INNER JOIN countries AS my_countries
ON pairings.my_country_id = my_countries.id
INNER JOIN countries AS enemy_countries
ON pairings.enemy_country_id = enemy_countries.id
LEFT JOIN goals
ON pairings.id = goals.pairing_id
WHERE my_countries.group_name = 'C'
GROUP BY
    pairings.kickoff,
    my_countries.name,
    enemy_countries.name,
    my_countries.ranking,
    enemy_countries.ranking
ORDER BY
    pairings.kickoff,
    my_countries.ranking;

    