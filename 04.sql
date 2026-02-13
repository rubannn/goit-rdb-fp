SELECT
    year,
    MAKEDATE(year, 1) AS first_day_of_year,
    CURRENT_DATE() AS cur_date,
	TIMESTAMPDIFF(YEAR, MAKEDATE(year, 1), CURRENT_DATE())
        AS year_difference
FROM cases;
