# Analysis of Cardiac Health Factors

SQL-based analysis of a heart-disease dataset containing demographic and clinical variables such as age, sex, chest-pain type, resting blood pressure, cholesterol, fasting blood sugar, resting ECG results, maximum heart rate, exercise-induced angina, ST depression, major-vessel count, thalassemia code, and a binary heart-disease target.

The project focuses on descriptive analysis in MySQL. It is intended for learning SQL, data cleaning, grouping, aggregation, and interpretation of health-related tabular data. It is not a clinical diagnostic system.

## Project goals

- inspect the dataset before analysis
- create a reproducible MySQL table
- validate category ranges and missing values
- measure heart-disease prevalence across selected factors
- compare demographic and clinical groups
- document the meaning and limitations of the fields
- keep the analysis queries separate from schema and data-quality checks

## Repository structure

```text
Analysis-of-Cardiac-Health-Factors/
├── data/
│   └── heart_dataset.csv
├── docs/
│   ├── DATA_DICTIONARY.md
│   ├── cardiac-health-presentation.pdf
│   └── cardiac-health-report.docx
├── sql/
│   ├── 01_schema.sql
│   ├── 02_load_data_template.sql
│   ├── 03_data_quality_checks.sql
│   └── 04_analysis_queries.sql
├── .gitattributes
├── .gitignore
└── README.md
```

## Dataset

The CSV uses the 14-column schema commonly seen in processed Cleveland heart-disease datasets:

```text
age, sex, cp, trestbps, chol, fbs, restecg,
thalach, exang, oldpeak, slope, ca, thal, target
```

The original repository did not document the exact download URL used for this copy. Before presenting the dataset as an exact UCI export, verify the original source and add it here.

Reference for the underlying Heart Disease dataset:

https://archive.ics.uci.edu/dataset/45/heart+disease

The repository CSV should also be checked against the source copy before relying on row counts, because the original GitHub file reports 303 total lines while commonly circulated copies of this processed CSV contain a header plus 303 data rows.

## Important coding note

This CSV uses zero-based categorical coding for fields such as chest-pain type. For example, the processed version uses `cp` values from `0` to `3`.

The original SQL used a `1` to `4` mapping for `cp`, which left `cp = 0` unmapped. The cleaned queries use the coding expected by this CSV structure.

See [docs/DATA_DICTIONARY.md](docs/DATA_DICTIONARY.md) before interpreting the queries.

## Requirements

- MySQL 8.x or a compatible MySQL environment
- MySQL Workbench is optional but useful for importing the CSV

No Python environment is required for the maintained project.

## How to run

### 1. Create the database and table

Run:

```text
sql/01_schema.sql
```

### 2. Import the CSV

The simplest method in MySQL Workbench is:

1. Create the table using `01_schema.sql`.
2. Open **Table Data Import Wizard**.
3. Select `data/heart_dataset.csv`.
4. Import it into `heart_disease_data`.
5. Confirm that the columns map in the same order as the CSV header.

A `LOAD DATA LOCAL INFILE` example is also provided in:

```text
sql/02_load_data_template.sql
```

Update the file path before running it.

### 3. Validate the data

Run:

```text
sql/03_data_quality_checks.sql
```

Check the row count, missing values, target balance, and category ranges before interpreting results.

### 4. Run the analysis

Run:

```text
sql/04_analysis_queries.sql
```

The analysis includes:

- overall heart-disease prevalence
- prevalence by sex
- prevalence by age group
- chest-pain category comparison
- fasting-blood-sugar comparison
- cholesterol grouping
- exercise-induced angina comparison
- resting-ECG comparison
- major-vessel count comparison
- average clinical measurements by target class

## Key corrections from the original SQL

The original project was useful as a first analysis, but several query definitions needed correction.

### Chest-pain coding

The old query mapped `cp` as `1` to `4`. The processed CSV uses `0` to `3`, so `cp = 0` was not labelled correctly.

### Percentage by sex

The old gender query calculated each gender's share of the full dataset. That is not the same as disease prevalence within each gender.

The updated query reports:

```text
disease-positive records / total records in that gender
```

### Terminology

The target represents heart-disease status in the dataset. The cleaned SQL avoids calling every positive record a "heart attack" or treating the result as a clinical risk estimate.

### Reproducibility

The old SQL created a table but did not include a reproducible CSV-loading step or data-quality checks. Those steps are now separated into dedicated SQL files.

## Analysis interpretation

The queries show associations within this dataset. They do not prove that a factor causes heart disease. They also should not be used to make medical decisions about individuals.

## Limitations

- the dataset is small
- the exact provenance of the repository CSV was not documented in the original commit
- categorical encodings are dataset-specific
- the analysis is descriptive, not causal
- no statistical significance testing is included
- no adjustment is made for confounding variables
- the dataset is not representative of every population

## Future improvements

- verify and document the exact source file and license
- compare the repository CSV against the source checksum and row count
- add saved query outputs or screenshots from MySQL Workbench
- add visualizations in Power BI, Tableau, or Python only if they add value
- add statistical testing where appropriate
- separate exploratory findings from clinical interpretation

## Supporting documents

The original report and presentation are kept under `docs/` with clearer filenames.

## Repository purpose

This repository is best presented as a small SQL/data-analysis portfolio project. The goal is clear SQL, correct grouping logic, reproducible setup, and careful interpretation rather than unnecessary application infrastructure.
