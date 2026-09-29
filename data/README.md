# Dataset Folder

Place the original repository CSV here with this filename:

```text
heart_dataset.csv
```

The migration script `REPLACE_IN_OLD_FOLDER.bat` automatically moves the old root-level `heart_dataset.csv` into this folder when it exists.

Expected columns:

```text
age,sex,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal,target
```

Do not replace the original dataset with a different public `heart.csv` without rechecking all categorical encodings in the SQL and documentation.
