# Population segmentation for health system management
Mimic-III clinical database consists of health data of forty thousand patients in Beth Israel Deaconess Medical Center in Boston from 2001 to 2012. The dataset includes information such as diagnosis, demographics, prescriptions, ICU stays, procedures, vital signs and mortality.

International Statistical Classification of Diseases and Related Health Problems, ICD-9 code, is a list of codes used to classify disease, symptoms and external causes of disease. ICD-9 code was used to categorize diseases.  

## Diabetes Matrix Description
The matrix contains diabetes patients administered for ICU. The matrix has 10,310 rows × 931 columns. Each row represents a patient.

Patients.csv, D_ICD_DIAGNOSES.csv, DIAGNOSES_ICD.csv, ADMISSIONS.csv and ICUSTAYS.csv are joined to create the matrix with diagnoses matched to patients, ICD9 code, disease categories and demographic information.

Numerical columns:
* LOS is the length of the ICU stay of a patient. The length of stay is measured in days.
* Hospitalization is the number of hospitalizations of each patient.

Categorical/ Binary columns:
* Admission type columns: elective, emergency, newborn, urgent
* Marital status columns:  divorced, life partner, married, NaN, separated, single,  unknown (default), widowed
* Insurance columns:  government, Medicaid, Medicare, private, self-pay
* Ethnicity columns: there are 40 ethnicity columns. ASIAN, WHITE, BLACK/AFRICAN AMERICAN, HISPANIC OR LATINO, etc.
* Gender: 1 for males. 0 for females
* Dead: 1 for death. 0 otherwise
* ICD9 code columns: Column names are 3-4 digit alphanumerics. 1 if a patient has a disease with the ICD9 code, 0 otherwise

Ordinal column:  
* ORDINAL_AGE column: the following 10 age groups are assigned to 1-10 in ascending order. AGE: 0-10,  AGE: 11-20, AGE: 21-30, AGE: 31-40, AGE: 41-50, AGE: 51-60, AGE: 61-70, AGE: 71-80, AGE: 81-89, AGE: 90+

Diabetes_Numerical.csv and Diabetes_Category.csv are the same matrices.
Diabetes_Numerical.csv column data types are all numbers. Diabetes_Category.csv column data types are numbers for numerical columns and categories for categorical columns.

## Low Rank Model
K-means clustering is used to find clusters of similar patients.  Using low rank model, the diabetes patient matrix was fitted to k-means algorithm with different k values. Low rank model is used in GLRMfinal.ipynb

## Linear Regression
LOS prediction to evaluate the segmentation
Linear regression is used in diabetes_regression.ipynb

## Decision Tree
LOS prediction to evaluate the segmentation
Decision Tree is used in diabetes_regression.ipynb
