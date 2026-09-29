# Analysis of Cardiac Health Factors

SQL-based exploratory analysis of a heart-disease dataset containing demographic and clinical variables such as age, sex, chest-pain type, resting blood pressure, cholesterol, fasting blood sugar, resting ECG results, maximum heart rate, exercise-induced angina, ST depression, major-vessel count, thalassemia code, and a binary heart-disease target.

The project focuses on data validation, SQL aggregation, prevalence calculations, and careful interpretation of health-related tabular data. It is a portfolio/learning project and is not a medical diagnostic system.

## Project Objectives

- create a reproducible MySQL schema for the dataset
- validate category values, missing values, ranges, and duplicates before analysis
- measure heart-disease prevalence across demographic and clinical groups
- correct misleading percentage calculations from the original project
- keep database setup, data loading, quality checks, and analysis queries separate
- document the dataset fields and category encodings used by this repository

## Project Structure

```text
Analysis-of-Cardiac-Health-Factors/
├── data/
│   ├── heart_dataset.csv
│   └── README.md
├── docs/
│   ├── DATA_DICTIONARY.md
│   ├── ANALYSIS_GUIDE.md
│   ├── cardiac-health-presentation.pdf
│   └── cardiac-health-report.docx
├── results/
│   └── README.md
├── sql/
│   ├── 01_schema.sql
│   ├── 02_load_data_template.sql
│   ├── 03_data_quality_checks.sql
│   └── 04_analysis_queries.sql
├── .gitattributes
├── .gitignore
├── MIGRATION_GUIDE.md
├── REPLACE_IN_OLD_FOLDER.bat
└── README.md
```

The CSV, PDF, and DOCX are the original project assets. The migration script moves them from the old repository root into the structure shown above.

## Dataset

The CSV uses the following 14-column schema:

```text
age, sex, cp, trestbps, chol, fbs, restecg,
thalach, exang, oldpeak, slope, ca, thal, target
```

The exact original download URL for the processed CSV was not documented in the first version of this repository. The column layout is based on the Cleveland-style Heart Disease dataset.

Reference for the underlying UCI Heart Disease dataset:

https://archive.ics.uci.edu/dataset/45/heart+disease

Different processed versions of this dataset use different encodings. The SQL in this repository follows the coding used by the project CSV and the original project documentation.

## Important Chest-Pain Coding

The `cp` column in this project uses values from `1` through `4`:

| Code | Chest-pain type |
|---:|---|
| 1 | Typical angina |
| 2 | Atypical angina |
| 3 | Non-anginal pain |
| 4 | Asymptomatic |

Do not replace this with the zero-based `0-3` mapping used by some other processed versions of the dataset.

See [docs/DATA_DICTIONARY.md](docs/DATA_DICTIONARY.md) before interpreting the analysis.

## Requirements

- MySQL 8.x or a compatible MySQL environment
- MySQL Workbench is optional but convenient for CSV import

No Python environment is required.

## How to Run

### 1. Create the Database and Table

Run:

```text
sql/01_schema.sql
```

This creates:

```text
cardiac_health_analysis
heart_disease_data
```

### 2. Import the CSV

The dataset should be stored at:

```text
data/heart_dataset.csv
```

You can import it with MySQL Workbench's **Table Data Import Wizard**, or edit and run:

```text
sql/02_load_data_template.sql
```

For Windows paths in `LOAD DATA LOCAL INFILE`, use forward slashes, for example:

```text
C:/Users/YourName/Projects/Analysis-of-Cardiac-Health-Factors/data/heart_dataset.csv
```

### 3. Validate the Dataset

Run:

```text
sql/03_data_quality_checks.sql
```

This checks:

- imported row count
- NULL values
- target-class distribution
- category values
- numeric ranges
- duplicate rows
- values outside expected ranges

Do not interpret the analysis until these checks look reasonable.

### 4. Run the Analysis

Run:

```text
sql/04_analysis_queries.sql
```

The queries cover:

1. overall disease prevalence
2. prevalence by sex
3. prevalence by age group
4. prevalence by chest-pain type
5. fasting-blood-sugar groups
6. cholesterol groups
7. exercise-induced angina
8. resting ECG code
9. number of major vessels
10. thalassemia code
11. average continuous measurements by target class

## Main Corrections from the Original Project

### Percentage by Sex

The original SQL calculated:

```text
records in a gender / all dataset records
```

That answers "what percentage of the dataset belongs to this gender?" It does not answer "what percentage of this gender is disease-positive?"

The maintained query calculates:

```text
disease-positive records in the group / all records in that group
```

which is the prevalence within that group.

### Chest-Pain Mapping

The maintained project uses the `1-4` chest-pain encoding present in the original project:

```text
1 = Typical angina
2 = Atypical angina
3 = Non-anginal pain
4 = Asymptomatic
```

### Terminology

The target is treated as a heart-disease class, not as an individual probability of having a heart attack.

The maintained SQL therefore uses terms such as:

```text
disease-positive records
disease-negative records
heart-disease prevalence
```

instead of "high-risk patient" or "prone to heart attack".

### Reproducibility

The original single SQL file mixed table creation and analysis queries. The maintained version separates:

- schema creation
- data loading
- data-quality checks
- analysis

This makes the project easier to review, rerun, and explain in an interview.

## Interpreting the Results

The SQL queries describe associations within this dataset. They do not establish that a variable causes heart disease.

For example, a higher disease-positive percentage in one category does not prove that the category itself caused the outcome. Other variables may differ between groups.

## Limitations

- the dataset is relatively small
- the exact original download URL for this processed CSV was not recorded
- different processed versions of the dataset use different category encodings
- the analysis is descriptive, not causal
- no statistical-significance testing is included
- confounding variables are not controlled
- the dataset does not represent every population
- results depend on the quality and coding of the imported data

## Future Improvements

- document the exact source and license of the processed CSV if recovered
- save selected SQL result screenshots under `results/`
- compare multiple variables together instead of only one factor at a time
- add statistical testing where appropriate
- build a Power BI or Tableau dashboard only if it adds useful analytical context
- compare findings with another validated heart-disease dataset

## Supporting Documents

The original project report and presentation should be stored under `docs/` as:

```text
docs/cardiac-health-report.docx
docs/cardiac-health-presentation.pdf
```

They are kept as supporting material; the maintained SQL files are the source of truth for the current analysis.
