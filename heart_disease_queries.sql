CREATE DATABASE heart_disease_analysis;

USE heart_disease_analysis;

CREATE TABLE heart_disease_data (
    age INT, 
    sex TINYINT, -- Gender: 1 for Male, 0 for Female
    cp TINYINT, -- Chest pain type: 1-4
    trestbps INT, -- Resting blood pressure in mm Hg
    chol INT, -- Serum cholesterol in mg/dl
    fbs TINYINT, -- Fasting blood sugar > 120 mg/dl (1 = True, 0 = False)
    restecg TINYINT, -- Resting electrocardiographic results
    thalach INT, -- Maximum heart rate achieved
    exang TINYINT, -- Exercise-induced angina (1 = Yes, 0 = No)
    oldpeak FLOAT, -- ST depression induced by exercise relative to rest
    slope TINYINT, -- Slope of the peak exercise ST segment
    ca TINYINT, -- Number of major vessels (0-3) colored by fluoroscopy
    thal TINYINT, -- Thalassemia type: 3 = Normal, 6 = Fixed defect, 7 = Reversible defect
    target TINYINT -- Presence of heart disease: 1 = Disease, 0 = No Disease
);
select * from heart_disease_data;
-- 1) Analyze the percentage of male and female patients prone to heart attacks
SELECT 
    CASE 
        WHEN sex = 1 THEN 'Male'
        WHEN sex = 0 THEN 'Female'
    END AS gender, -- Gender label for readability
    COUNT(*) AS total_patients, -- Total number of patients in each gender
    SUM(target) AS high_risk_patients, -- Total number of high-risk patients
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM heart_disease_data)) AS percentage -- Percentage of total patients
FROM 
    heart_disease_data
GROUP BY 
    sex;

-- 2) Analyze age groups prone to heart attacks
SELECT 
    FLOOR(age / 10) * 10 AS age_group,  
    COUNT(*) AS total_patients,  
    SUM(target) AS high_risk_patients  
FROM 
    heart_disease_data
GROUP BY 
    age_group
ORDER BY 
    high_risk_patients DESC;  
    
-- 3)Analyze chest pain types and their correlation with heart attack risk
SELECT 
    CASE 
        WHEN cp = 1 THEN 'Typical Angina'
        WHEN cp = 2 THEN 'Atypical Angina'
        WHEN cp = 3 THEN 'Non-Anginal Pain'
        WHEN cp = 4 THEN 'Asymptomatic'
    END AS chest_pain_type,  
    COUNT(*) AS total_patients,  
    SUM(target) AS high_risk_patients,  
    (SUM(target) / COUNT(*)) * 100 AS risk_percentage  
FROM 
    heart_disease_data
GROUP BY 
    cp
ORDER BY 
    risk_percentage DESC; 
    
-- 4) Analyze fasting blood sugar levels and their correlation with heart attack risk
SELECT 
    CASE 
        WHEN fbs = 1 THEN '> 120 mg/dl (True)'
        WHEN fbs = 0 THEN '<= 120 mg/dl (False)'
    END AS fasting_blood_sugar,  
    COUNT(*) AS total_patients,  
    SUM(target) AS high_risk_patients,  
    (SUM(target) / COUNT(*)) * 100 AS risk_percentage   
FROM 
    heart_disease_data
GROUP BY 
    fbs;

-- 5)Analyze cholesterol levels and their correlation with heart attack risk
SELECT 
    CASE 
        WHEN chol < 200 THEN 'Normal'
        WHEN chol BETWEEN 200 AND 239 THEN 'Borderline High'
        ELSE 'High'
    END AS cholesterol_level, 
    COUNT(*) AS total_patients, 
    SUM(target) AS high_risk_patients, 
    (SUM(target) / COUNT(*)) * 100 AS risk_percentage 
FROM 
    heart_disease_data
GROUP BY 
    cholesterol_level
ORDER BY 
    risk_percentage DESC;  
    
-- THANKING YOU !!