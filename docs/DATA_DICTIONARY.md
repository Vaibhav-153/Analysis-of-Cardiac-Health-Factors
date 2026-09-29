# Data Dictionary

This document describes the columns used in `data/heart_dataset.csv`.

The project contains demographic and clinical measurements associated with a binary heart-disease target. Different public processed versions of the Heart Disease dataset can use different encodings, so category values should always be checked against the exact CSV used by the project.

## Columns

| Column | Meaning | Coding / unit |
|---|---|---|
| `age` | Age | years |
| `sex` | Sex code | `0` = female, `1` = male |
| `cp` | Chest-pain type | `1-4` in this project |
| `trestbps` | Resting blood pressure | mm Hg |
| `chol` | Serum cholesterol | mg/dL |
| `fbs` | Fasting blood sugar > 120 mg/dL | `0` = false, `1` = true |
| `restecg` | Resting ECG result | categorical code |
| `thalach` | Maximum heart rate achieved | beats per minute |
| `exang` | Exercise-induced angina | `0` = no, `1` = yes |
| `oldpeak` | ST depression induced by exercise relative to rest | numeric |
| `slope` | Slope of the peak exercise ST segment | categorical code |
| `ca` | Number of major vessels coloured by fluoroscopy | numeric category |
| `thal` | Thalassemia-related code | categorical code |
| `target` | Heart-disease class | `0` = negative, `1` = positive |

## Chest-Pain Type — `cp`

The original project uses the following coding:

| Value | Meaning |
|---:|---|
| 1 | Typical angina |
| 2 | Atypical angina |
| 3 | Non-anginal pain |
| 4 | Asymptomatic |

This is intentionally different from zero-based versions of similar processed datasets.

## Sex — `sex`

| Value | Meaning |
|---:|---|
| 0 | Female |
| 1 | Male |

## Fasting Blood Sugar — `fbs`

Indicates whether fasting blood sugar is greater than 120 mg/dL.

| Value | Meaning |
|---:|---|
| 0 | False |
| 1 | True |

## Exercise-Induced Angina — `exang`

| Value | Meaning |
|---:|---|
| 0 | No |
| 1 | Yes |

## Target — `target`

| Value | Meaning |
|---:|---|
| 0 | Disease-negative class |
| 1 | Disease-positive class |

The target should not be interpreted as an individual probability of suffering a heart attack.

## Resting ECG — `restecg`

The schema accepts codes `0`, `1`, and `2`.

The analysis groups by the numeric code instead of assigning detailed clinical text labels because the exact processed-source documentation for this CSV was not preserved in the original repository.

## ST Slope — `slope`

The original Cleveland coding commonly uses:

| Value | Meaning |
|---:|---|
| 1 | Upsloping |
| 2 | Flat |
| 3 | Downsloping |

The maintained schema accepts `1-3`.

## Major Vessels — `ca`

Represents the number of major vessels coloured by fluoroscopy.

The maintained schema accepts `0-4` so the project can validate common processed variants without silently dropping a record. Inspect `sql/03_data_quality_checks.sql` to see the values actually present in your imported CSV.

## Thalassemia Code — `thal`

The original project documents the traditional Cleveland coding:

| Value | Meaning |
|---:|---|
| 3 | Normal |
| 6 | Fixed defect |
| 7 | Reversible defect |

The maintained schema accepts these values. If the data-quality query shows a different code, verify the source before changing the label.

## Why Encoding Validation Matters

SQL can execute successfully even when category labels are wrong. Incorrect mappings can therefore create plausible-looking but misleading results.

The project keeps a separate data-quality script so that category values are checked before analysis.

## Dataset Reference

Underlying dataset reference:

https://archive.ics.uci.edu/dataset/45/heart+disease

The exact URL used to download the processed CSV in the original project was not recorded.
