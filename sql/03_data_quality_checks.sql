-- MySQL 8.x
-- Run these checks after importing the CSV and before interpreting results.

USE cardiac_health_analysis;

-- 1. Row count
SELECT COUNT(*) AS total_rows
FROM heart_disease_data;

-- 2. NULL counts
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

-- 3. Target distribution
SELECT
    target,
    COUNT(*) AS records,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM heart_disease_data
GROUP BY target
ORDER BY target;

-- 4. Verify categorical values actually present
SELECT 'sex' AS field, CAST(sex AS CHAR) AS value, COUNT(*) AS records
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
ORDER BY field, value;

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

-- 6. Values outside the expected project encodings
SELECT
    SUM(sex NOT IN (0, 1)) AS invalid_sex,
    SUM(cp NOT BETWEEN 1 AND 4) AS invalid_cp,
    SUM(fbs NOT IN (0, 1)) AS invalid_fbs,
    SUM(restecg NOT BETWEEN 0 AND 2) AS invalid_restecg,
    SUM(exang NOT IN (0, 1)) AS invalid_exang,
    SUM(slope NOT BETWEEN 1 AND 3) AS invalid_slope,
    SUM(ca NOT BETWEEN 0 AND 4) AS invalid_ca,
    SUM(thal NOT IN (3, 6, 7)) AS invalid_thal,
    SUM(target NOT IN (0, 1)) AS invalid_target
FROM heart_disease_data;

-- 7. Exact duplicate rows
SELECT
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
    target,
    COUNT(*) AS duplicate_count
FROM heart_disease_data
GROUP BY
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
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;
