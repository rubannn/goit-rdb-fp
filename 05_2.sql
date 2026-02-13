DROP FUNCTION IF EXISTS cases_per_period;
DELIMITER //

CREATE FUNCTION cases_per_period(
    yearly_cases FLOAT,
    divisor INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN yearly_cases / NULLIF(divisor, 0);
END //

DELIMITER ;

SELECT
    Year,
    Number_malaria,
    ROUND(cases_per_period(Number_malaria, 12), 2) AS avg_per_month,
    ROUND(cases_per_period(Number_malaria, 4), 2)  AS avg_per_quarter,
    ROUND(cases_per_period(Number_malaria, 2), 2)  AS avg_per_half_year
FROM infectious_cases
WHERE Number_malaria IS NOT NULL
