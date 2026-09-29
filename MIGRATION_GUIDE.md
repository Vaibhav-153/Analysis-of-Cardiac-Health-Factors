# Replace the Old Repository with the Clean Structure

You already have an old local folder connected to GitHub. You do not need to clone the repository again.

## Recommended Method

1. Make a backup copy of the old project folder.
2. Extract this clean project ZIP somewhere temporary.
3. Copy all files from the clean project folder into your existing Git-connected repository folder.
4. Run `REPLACE_IN_OLD_FOLDER.bat` from the repository root.
5. Review `git status` before committing.

## What the Migration Script Does

It preserves and moves the original assets when they still exist at the repository root:

```text
heart_dataset.csv
Analysis of cardiac health ppt (1).pdf
Report of Cardiac Health.docx
```

They become:

```text
data/heart_dataset.csv
docs/cardiac-health-presentation.pdf
docs/cardiac-health-report.docx
```

It also removes the obsolete root-level:

```text
heart_disease_queries.sql
```

because the maintained SQL is now split across `sql/01_schema.sql` through `sql/04_analysis_queries.sql`.

## Verify the Final Tree

You should have:

```text
data/
docs/
results/
sql/
.gitattributes
.gitignore
MIGRATION_GUIDE.md
README.md
REPLACE_IN_OLD_FOLDER.bat
```

The old root-level CSV, old SQL, PDF, and DOCX should no longer remain as duplicate files.

## Git Checks

Run:

```bat
git status
```

Check the important coding corrections:

```bat
git grep "cp BETWEEN 1 AND 4"
git grep "WHEN 4 THEN 'Asymptomatic'"
git grep "WHEN 0 THEN 'Typical angina'"
```

The last command should return no result.

## Commit

```bat
git add .
git commit -m "Refactor cardiac health SQL analysis project"
git push origin main
```

## GitHub About Section

After pushing, set the repository description to:

```text
SQL analysis of cardiac health factors using MySQL and a processed heart-disease dataset.
```

Recommended topics:

```text
sql
mysql
data-analysis
heart-disease
healthcare-data
exploratory-data-analysis
data-cleaning
portfolio-project
```
