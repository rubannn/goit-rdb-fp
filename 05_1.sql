DROP FUNCTION IF EXISTS year_diff_from_today;
DELIMITER //

CREATE FUNCTION year_diff_from_today(input_year INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(
        YEAR,
        MAKEDATE(input_year, 1),
        CURRENT_DATE()
    );
END //

DELIMITER ;

SELECT
    year,
    year_diff_from_today(year) AS year_difference
FROM cases
ORDER BY year;
