-- MySQL 8.x
-- Database and table definition for the cardiac-health analysis.

CREATE DATABASE IF NOT EXISTS cardiac_health_analysis;

USE cardiac_health_analysis;

DROP TABLE IF EXISTS heart_disease_data;

CREATE TABLE heart_disease_data (
    age SMALLINT UNSIGNED NOT NULL,
    sex TINYINT UNSIGNED NOT NULL,
    cp TINYINT UNSIGNED NOT NULL,
    trestbps SMALLINT UNSIGNED NOT NULL,
    chol SMALLINT UNSIGNED NOT NULL,
    fbs TINYINT UNSIGNED NOT NULL,
    restecg TINYINT UNSIGNED NOT NULL,
    thalach SMALLINT UNSIGNED NOT NULL,
    exang TINYINT UNSIGNED NOT NULL,
    oldpeak DECIMAL(4, 1) NOT NULL,
    slope TINYINT UNSIGNED NOT NULL,
    ca TINYINT UNSIGNED NOT NULL,
    thal TINYINT UNSIGNED NOT NULL,
    target TINYINT UNSIGNED NOT NULL,

    CONSTRAINT chk_age CHECK (age BETWEEN 1 AND 120),
    CONSTRAINT chk_sex CHECK (sex IN (0, 1)),
    CONSTRAINT chk_cp CHECK (cp BETWEEN 1 AND 4),
    CONSTRAINT chk_trestbps CHECK (trestbps > 0),
    CONSTRAINT chk_chol CHECK (chol > 0),
    CONSTRAINT chk_fbs CHECK (fbs IN (0, 1)),
    CONSTRAINT chk_restecg CHECK (restecg BETWEEN 0 AND 2),
    CONSTRAINT chk_thalach CHECK (thalach > 0),
    CONSTRAINT chk_exang CHECK (exang IN (0, 1)),
    CONSTRAINT chk_oldpeak CHECK (oldpeak >= 0),
    CONSTRAINT chk_slope CHECK (slope BETWEEN 1 AND 3),
    CONSTRAINT chk_ca CHECK (ca BETWEEN 0 AND 4),
    CONSTRAINT chk_thal CHECK (thal IN (3, 6, 7)),
    CONSTRAINT chk_target CHECK (target IN (0, 1))
);
