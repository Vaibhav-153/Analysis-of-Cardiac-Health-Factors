# Apply the final Cardiac Health corrections

This correction fixes the chest-pain coding after checking the actual repository CSV and removes duplicate legacy root files.

## 1. Copy/replace these files

- `README.md`
- `docs/DATA_DICTIONARY.md`
- `sql/01_schema.sql`
- `sql/04_analysis_queries.sql`

## 2. Remove legacy duplicate files from the repository root

Run from the repository root:

```bat
git rm heart_disease_queries.sql
git rm heart_dataset.csv
```

If the old report/presentation are still at the root and the renamed copies already exist under `docs/`, remove the root duplicates too:

```bat
git rm "Analysis of cardiac health ppt (1).pdf"
git rm "Report of Cardiac Health.docx"
```

## 3. Expected maintained files

The dataset should exist only at `data/heart_dataset.csv`.
The analysis SQL should exist only under `sql/`.
The report and presentation should exist only under `docs/`.

## 4. Important verified correction

The current repository CSV contains chest-pain (`cp`) values `1`, `2`, `3`, and `4`. The schema therefore validates `cp BETWEEN 1 AND 4`, and the labels are:

- 1 = Typical angina
- 2 = Atypical angina
- 3 = Non-anginal pain
- 4 = Asymptomatic

## 5. Commit

```bat
git status
git add .
git commit -m "Fix dataset coding and remove legacy duplicates"
git push origin main
```

After pushing, verify that only the organized `data/`, `docs/`, and `sql/` copies remain.
