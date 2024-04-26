USE pandemic;

CREATE TABLE IF NOT EXISTS countries (
    id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    country_code VARCHAR(10) NOT NULL UNIQUE
);

INSERT INTO countries (country_name, country_code)
SELECT DISTINCT entity, code FROM infectious_cases;

SELECT * FROM countries;

CREATE TABLE IF NOT EXISTS infectious_cases_norm AS SELECT * FROM infectious_cases;

ALTER TABLE infectious_cases_norm
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST,
ADD COLUMN country_id INT AFTER id,
ADD CONSTRAINT fk_country_id FOREIGN KEY (country_id) REFERENCES countries(id);

SET SQL_SAFE_UPDATES = 0;

UPDATE infectious_cases_norm AS i
JOIN countries AS c ON i.code = c.country_code
SET i.country_id = c.id;

ALTER TABLE infectious_cases_norm
DROP COLUMN entity,
DROP COLUMN code;

RENAME TABLE infectious_cases_norm TO infectious_stats;

SELECT * FROM infectious_stats;
SET SQL_SAFE_UPDATES = 1;