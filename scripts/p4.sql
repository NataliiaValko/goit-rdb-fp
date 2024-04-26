USE pandemic;

SELECT 
    id,
    year,
    MAKEDATE(year, 1) AS initial_date,
    CURDATE() AS cur_date,
    TIMESTAMPDIFF(YEAR,
        MAKEDATE(year, 1),
        CURDATE()) AS subtraction_years
FROM
    infectious_stats;