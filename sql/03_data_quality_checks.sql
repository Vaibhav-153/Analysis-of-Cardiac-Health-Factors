-- MySQL 8.x
-- Run these checks after importing the CSV and before interpreting the analysis.

USE cardiac_health_analysis;

-- 1. Row count
SELECT COUNT(*) AS row_count
FROM heart_disease_data;

-- 2. Missing-value check
SELECT
    SUM(age IS NULL) AS age_nulls,
    SUM(sex IS NULL) AS sex_nulls,
    SUM(cp IS NULL) AS cp_nulls,
    SUM(trestbps IS NULL) AS trestbps_nulls,
    SUM(chol IS NULL) AS chol_nulls,
    SUM(fbs IS NULL) AS fbs_nulls,
    SUM(restecg IS NULL) AS restecg_nulls,
    SUM(thalach IS NULL) AS thalach_nulls,
    SUM(exang IS NULL) AS exang_nulls,
    SUM(oldpeak IS NULL) AS oldpeak_nulls,
    SUM(slope IS NULL) AS slope_nulls,
    SUM(ca IS NULL) AS ca_nulls,
    SUM(thal IS NULL) AS thal_nulls,
    SUM(target IS NULL) AS target_nulls
FROM heart_disease_data;

-- 3. Target-class balance
SELECT
    target,
    COUNT(*) AS records,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM heart_disease_data
GROUP BY target
ORDER BY target;

-- 4. Validate observed category values
SELECT 'sex' AS field_name, CAST(sex AS CHAR) AS value_code, COUNT(*) AS records
FROM heart_disease_data
GROUP BY sex
UNION ALL
SELECT 'cp', CAST(cp AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY cp
UNION ALL
SELECT 'fbs', CAST(fbs AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY fbs
UNION ALL
SELECT 'restecg', CAST(restecg AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY restecg
UNION ALL
SELECT 'exang', CAST(exang AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY exang
UNION ALL
SELECT 'slope', CAST(slope AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY slope
UNION ALL
SELECT 'ca', CAST(ca AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY ca
UNION ALL
SELECT 'thal', CAST(thal AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY thal
UNION ALL
SELECT 'target', CAST(target AS CHAR), COUNT(*)
FROM heart_disease_data
GROUP BY target
ORDER BY field_name, value_code;

-- 5. Numeric ranges
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    MIN(trestbps) AS min_resting_bp,
    MAX(trestbps) AS max_resting_bp,
    MIN(chol) AS min_cholesterol,
    MAX(chol) AS max_cholesterol,
    MIN(thalach) AS min_max_heart_rate,
    MAX(thalach) AS max_max_heart_rate,
    MIN(oldpeak) AS min_oldpeak,
    MAX(oldpeak) AS max_oldpeak
FROM heart_disease_data;
