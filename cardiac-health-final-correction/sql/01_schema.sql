-- MySQL 8.x
-- Create the database and table used by the analysis.

CREATE DATABASE IF NOT EXISTS cardiac_health_analysis;
USE cardiac_health_analysis;

DROP TABLE IF EXISTS heart_disease_data;

CREATE TABLE heart_disease_data (
    age INT NOT NULL,
    sex TINYINT NOT NULL,
    cp TINYINT NOT NULL,
    trestbps INT NOT NULL,
    chol INT NOT NULL,
    fbs TINYINT NOT NULL,
    restecg TINYINT NOT NULL,
    thalach INT NOT NULL,
    exang TINYINT NOT NULL,
    oldpeak DECIMAL(4, 1) NOT NULL,
    slope TINYINT NOT NULL,
    ca TINYINT NOT NULL,
    thal TINYINT NOT NULL,
    target TINYINT NOT NULL,

    CONSTRAINT chk_sex CHECK (sex IN (0, 1)),
    CONSTRAINT chk_cp CHECK (cp BETWEEN 1 AND 4),
    CONSTRAINT chk_fbs CHECK (fbs IN (0, 1)),
    CONSTRAINT chk_restecg CHECK (restecg BETWEEN 0 AND 2),
    CONSTRAINT chk_exang CHECK (exang IN (0, 1)),
    CONSTRAINT chk_slope CHECK (slope BETWEEN 0 AND 2),
    CONSTRAINT chk_ca CHECK (ca BETWEEN 0 AND 4),
    CONSTRAINT chk_thal CHECK (thal BETWEEN 0 AND 3),
    CONSTRAINT chk_target CHECK (target IN (0, 1))
);
