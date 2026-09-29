# Data Dictionary

This file documents the 14 columns used by the repository CSV.

The column names match the commonly used processed Cleveland heart-disease schema. Some categorical values in this processed CSV are zero-based transformations of the original UCI coding, so always verify the actual values in `data/heart_dataset.csv` before changing mappings.

| Column | Meaning | Notes |
| --- | --- | --- |
| `age` | Age in years | Numeric |
| `sex` | Sex code | `0` = female, `1` = male in this processed dataset |
| `cp` | Chest-pain type | Processed coding commonly uses `0` to `3` |
| `trestbps` | Resting blood pressure | mm Hg |
| `chol` | Serum cholesterol | mg/dL |
| `fbs` | Fasting blood sugar > 120 mg/dL | `0` = false, `1` = true |
| `restecg` | Resting ECG result | Common processed coding uses `0` to `2` |
| `thalach` | Maximum heart rate achieved | Numeric |
| `exang` | Exercise-induced angina | `0` = no, `1` = yes |
| `oldpeak` | ST depression induced by exercise relative to rest | Numeric |
| `slope` | Slope of peak exercise ST segment | Common processed coding uses `0` to `2` |
| `ca` | Number of major vessels coloured by fluoroscopy | Processed copies may contain `0` to `4` |
| `thal` | Thalassemia-related code | Mapping depends on the processed copy; inspect actual values before assigning labels |
| `target` | Heart-disease target | `0` = negative class, `1` = positive class in the processed CSV |

## Chest-pain mapping used in the maintained queries

For the processed zero-based CSV used by this project:

| `cp` | Label |
| ---: | --- |
| 0 | Typical angina |
| 1 | Atypical angina |
| 2 | Non-anginal pain |
| 3 | Asymptomatic |

If your local CSV uses the original UCI 1-4 chest-pain coding instead, update `sql/04_analysis_queries.sql` before interpreting the results.

## Why the coding matters

Using the wrong category mapping can produce misleading labels even when the SQL executes without errors. The original repository SQL used a 1-4 chest-pain mapping while the processed CSV format commonly uses 0-3. The maintained queries correct that mismatch.

## Source note

Underlying dataset reference:

https://archive.ics.uci.edu/dataset/45/heart+disease

The exact origin URL of the repository CSV should be added once confirmed from the original project source.
