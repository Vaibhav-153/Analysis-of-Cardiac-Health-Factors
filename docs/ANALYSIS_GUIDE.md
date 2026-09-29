# Analysis Guide

This file explains how to discuss the project in a review, placement interview, or portfolio walkthrough.

## Recommended Workflow

1. Create the database and table with `sql/01_schema.sql`.
2. Import `data/heart_dataset.csv`.
3. Run `sql/03_data_quality_checks.sql`.
4. Confirm the category values and row count.
5. Run `sql/04_analysis_queries.sql`.
6. Save only useful result screenshots under `results/`.
7. Interpret percentages as dataset associations, not medical causation.

## Questions the SQL Answers

- What proportion of the imported records are disease-positive?
- How does disease prevalence differ by sex?
- How does prevalence vary across age groups?
- Which chest-pain categories have higher or lower disease-positive percentages in this dataset?
- How do fasting blood sugar and cholesterol groups compare?
- How does exercise-induced angina relate to the target in the dataset?
- How do average age, blood pressure, cholesterol, maximum heart rate, and oldpeak differ between target classes?

## Important Distinction: Count vs Prevalence

A group can have more disease-positive records simply because it contains more records overall.

For group comparisons, the project calculates:

```text
disease-positive records in group / total records in group * 100
```

This is more informative than comparing raw positive counts alone.

## What Not to Claim

Do not say:

- a variable causes heart disease
- the SQL predicts whether a person will have a heart attack
- the analysis is clinically validated
- a group is medically high-risk based only on this dataset

Prefer:

- "In this dataset, the disease-positive percentage was higher/lower for..."
- "The query shows an association in the available records."
- "Further statistical and clinical validation would be required."

## Interview Talking Points

A concise explanation of the improvements:

- The original project mixed schema creation and analysis in one SQL file.
- I separated database setup, import, validation, and analysis.
- I corrected a percentage query that measured dataset composition instead of within-group disease prevalence.
- I documented the `1-4` chest-pain mapping used by the project.
- I replaced "heart attack risk" wording with heart-disease class/prevalence terminology.
- I added checks for missing values, invalid categories, ranges, and duplicates before analysis.

These are practical data-quality and SQL-engineering improvements rather than cosmetic changes.
