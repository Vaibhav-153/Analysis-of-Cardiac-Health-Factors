-- MySQL 8.x
-- Descriptive analysis of the imported heart-disease dataset.
-- The queries describe associations inside this dataset; they do not establish causation.

USE cardiac_health_analysis;

-- 1. Overall target distribution and prevalence
SELECT
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    SUM(CASE WHEN target = 0 THEN 1 ELSE 0 END) AS disease_negative_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data;

-- 2. Heart-disease prevalence by sex
SELECT
    CASE sex
        WHEN 0 THEN 'Female'
        WHEN 1 THEN 'Male'
        ELSE 'Unknown'
    END AS sex_label,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY sex
ORDER BY disease_prevalence_pct DESC;

-- 3. Heart-disease prevalence by age group
SELECT
    CASE
        WHEN age < 40 THEN 'Under 40'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        WHEN age BETWEEN 50 AND 59 THEN '50-59'
        WHEN age BETWEEN 60 AND 69 THEN '60-69'
        ELSE '70+'
    END AS age_group,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY age_group
ORDER BY MIN(age);

-- 4. Heart-disease prevalence by chest-pain type
-- This repository's processed CSV uses zero-based cp codes: 0-3.
SELECT
    CASE cp
        WHEN 0 THEN 'Typical angina'
        WHEN 1 THEN 'Atypical angina'
        WHEN 2 THEN 'Non-anginal pain'
        WHEN 3 THEN 'Asymptomatic'
        ELSE 'Unknown'
    END AS chest_pain_type,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY cp
ORDER BY disease_prevalence_pct DESC;

-- 5. Heart-disease prevalence by fasting-blood-sugar group
SELECT
    CASE fbs
        WHEN 0 THEN '<= 120 mg/dL'
        WHEN 1 THEN '> 120 mg/dL'
        ELSE 'Unknown'
    END AS fasting_blood_sugar_group,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY fbs
ORDER BY disease_prevalence_pct DESC;

-- 6. Heart-disease prevalence by cholesterol group
SELECT
    CASE
        WHEN chol < 200 THEN '< 200 mg/dL'
        WHEN chol BETWEEN 200 AND 239 THEN '200-239 mg/dL'
        ELSE '>= 240 mg/dL'
    END AS cholesterol_group,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY cholesterol_group
ORDER BY disease_prevalence_pct DESC;

-- 7. Heart-disease prevalence by exercise-induced angina
SELECT
    CASE exang
        WHEN 0 THEN 'No'
        WHEN 1 THEN 'Yes'
        ELSE 'Unknown'
    END AS exercise_induced_angina,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY exang
ORDER BY disease_prevalence_pct DESC;

-- 8. Heart-disease prevalence by resting ECG code
SELECT
    restecg AS resting_ecg_code,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY restecg
ORDER BY disease_prevalence_pct DESC;

-- 9. Heart-disease prevalence by number of major vessels
SELECT
    ca AS major_vessels_code,
    COUNT(*) AS total_records,
    SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) AS disease_positive_records,
    ROUND(
        100.0 * SUM(CASE WHEN target = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS disease_prevalence_pct
FROM heart_disease_data
GROUP BY ca
ORDER BY ca;

-- 10. Average continuous measurements by target class
SELECT
    CASE target
        WHEN 0 THEN 'Disease negative'
        WHEN 1 THEN 'Disease positive'
    END AS target_group,
    COUNT(*) AS records,
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(trestbps), 2) AS avg_resting_bp,
    ROUND(AVG(chol), 2) AS avg_cholesterol,
    ROUND(AVG(thalach), 2) AS avg_max_heart_rate,
    ROUND(AVG(oldpeak), 2) AS avg_oldpeak
FROM heart_disease_data
GROUP BY target
ORDER BY target;
