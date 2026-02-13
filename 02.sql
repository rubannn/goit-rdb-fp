-- =========================================
-- ВІДКЛЮЧЕННЯ ПЕРЕВІРКИ ЗОВНІШНІХ КЛЮЧІВ
-- =========================================
SET FOREIGN_KEY_CHECKS = 0;

-- =========================================
-- ТАБЛИЦЯ COUNTRIES
-- =========================================
DROP TABLE IF EXISTS countries;

CREATE TABLE countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity VARCHAR(255) NOT NULL,
    code VARCHAR(10)
);

-- УВІМКНЕННЯ ПЕРЕВІРКИ ЗОВНІШНІХ КЛЮЧІВ
SET FOREIGN_KEY_CHECKS = 1;

-- =========================================
-- ЗАПОВНЕННЯ ТАБЛИЦІ COUNTRIES
-- (УНІКАЛЬНІ КРАЇНИ З infectious_cases)
-- =========================================
INSERT INTO countries (entity, code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;


-- =========================================
-- ВІДКЛЮЧЕННЯ ПЕРЕВІРКИ ЗОВНІШНІХ КЛЮЧІВ
-- =========================================
SET FOREIGN_KEY_CHECKS = 0;


-- =========================================
-- ТАБЛИЦЯ CASES
-- =========================================
DROP TABLE IF EXISTS cases;

CREATE TABLE cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT NOT NULL,
    year INT,
    polio_cases INT DEFAULT NULL,
    cases_guinea_worm INT DEFAULT NULL,
    Number_yaws FLOAT DEFAULT NULL,
    Number_rabies FLOAT DEFAULT NULL,
    Number_malaria FLOAT DEFAULT NULL,
    Number_hiv FLOAT DEFAULT NULL,
    Number_tuberculosis FLOAT DEFAULT NULL,
    Number_smallpox FLOAT DEFAULT NULL,
    Number_cholera_cases FLOAT DEFAULT NULL,
    CONSTRAINT fk_country
        FOREIGN KEY (country_id)
        REFERENCES countries(id)
);

-- УВІМКНЕННЯ ПЕРЕВІРКИ ЗОВНІШНІХ КЛЮЧІВ
SET FOREIGN_KEY_CHECKS = 1;


-- =========================================
-- ЗАПОВНЕННЯ ТАБЛИЦІ CASES
-- (ПЕРЕНЕСЕННЯ ДАНИХ З infectious_cases)
-- =========================================
INSERT INTO cases (
    country_id,
    year,
    polio_cases,
    cases_guinea_worm,
    Number_yaws,
    Number_rabies,
    Number_malaria,
    Number_hiv,
    Number_tuberculosis,
    Number_smallpox,
    Number_cholera_cases
)
SELECT
    c.id,
    ic.Year,
    ic.polio_cases,
    ic.cases_guinea_worm,
    ic.Number_yaws,
    ic.Number_rabies,
    ic.Number_malaria,
    ic.Number_hiv,
    ic.Number_tuberculosis,
    ic.Number_smallpox,
    ic.Number_cholera_cases
FROM infectious_cases ic
JOIN countries c
    ON ic.Entity = c.entity
    AND ic.Code <=> c.code;


-- =========================================
-- ПЕРЕВІРКА КІЛЬКОСТІ ЗАПИСІВ
-- =========================================
SELECT COUNT(*) FROM countries;
SELECT COUNT(*) FROM cases;

SELECT * FROM countries  LIMIT 10;
SELECT * FROM cases LIMIT 10;
