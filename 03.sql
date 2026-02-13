SELECT
    c.id,
    c.entity,
    c.code,
    ROUND(AVG(cs.Number_rabies), 3) AS avg_rabies,
    ROUND(MIN(cs.Number_rabies), 3) AS min_rabies,
    ROUND(MAX(cs.Number_rabies), 3) AS max_rabies,
    ROUND(SUM(cs.Number_rabies), 3) AS sum_rabies
FROM cases cs
	JOIN countries c ON cs.country_id = c.id
WHERE
    cs.Number_rabies IS NOT NULL
GROUP BY c.id , c.entity , c.code
ORDER BY avg_rabies DESC
LIMIT 10;
