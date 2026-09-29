-- MySQL 8.x
-- Replace the path below with the absolute path to data/heart_dataset.csv.
-- On Windows, forward slashes are usually easiest to use in the path.
-- LOCAL INFILE must be enabled in both the client and server.

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
