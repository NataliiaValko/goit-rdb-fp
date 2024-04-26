USE pandemic;

DROP FUNCTION IF EXISTS subtraction_years;

DELIMITER //

CREATE FUNCTION Subtraction_years(year INT)
RETURNS INT
DETERMINISTIC 
NO SQL
BEGIN
    DECLARE result INT;
    SET result = TIMESTAMPDIFF(YEAR, MAKEDATE(year, 1), CURDATE());
    RETURN result;
END //

DELIMITER ;

SELECT 
    id, year, SUBTRACTION_YEARS(year) AS subtr_years
FROM
    infectious_stats;