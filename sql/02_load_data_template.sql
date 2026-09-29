-- MySQL 8.x
-- CSV import template.
--
-- Before running this file:
-- 1. Update the path below.
-- 2. Use forward slashes in Windows paths.
-- 3. Make sure LOCAL INFILE is enabled if your MySQL setup requires it.

USE cardiac_health_analysis;

LOAD DATA LOCAL INFILE 'C:/path/to/Analysis-of-Cardiac-Health-Factors/data/heart_dataset.csv'
INTO TABLE heart_disease_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(
    age,
    sex,
    cp,
    trestbps,
    chol,
    fbs,
    restecg,
    thalach,
    exang,
    oldpeak,
    slope,
    ca,
    thal,
    target
);

SELECT COUNT(*) AS imported_rows
FROM heart_disease_data;
