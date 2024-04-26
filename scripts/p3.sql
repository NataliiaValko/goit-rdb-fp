USE pandemic;

SELECT 
    country_id,
    AVG(number_rabies) AS avg_number_rabies,
    MIN(number_rabies) AS min_number_rabies,
    MAX(number_rabies) AS max_number_rabies,
    SUM(number_rabies) AS sum_number_rabies
FROM
    infectious_stats
WHERE
    number_rabies IS NOT NULL
        AND number_rabies <> ''
GROUP BY country_id
ORDER BY avg_number_rabies DESC
LIMIT 10;