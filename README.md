Project Overview
 	Mimic-III clinical database consists of health data of forty thousand patients in Beth Israel Deaconess Medical Center in Boston from 2001 to 2012. The dataset includes information such as diagnosis, demographics, prescriptions, ICU stays, procedures, vital signs and mortality. 
	International Statistical Classification of Diseases and Related Health Problems, ICD-9 code, is a list of codes used to classify disease, symptoms and external causes of disease. ICD-9 code was used to categorize diseases.  
Diabetes Matrix Description
	The matrix contains diabetes patients administered for ICU. The matrix has 10,310 rows × 931 columns. Each row represents a patient. Patients.csv, D_ICD_DIAGNOSES.csv, DIAGNOSES_ICD.csv, ADMISSIONS.csv and ICUSTAYS.csv are joined to create the matrix with diagnoses matched to patients, ICD9 code, disease categories and demographic information. 
Numerical columns: 
LOS is the length of ICU stay for the patient, which may include one or more ICU units. The length of stay is measured in days.
Hospitalization is the number of hospitalization of a patient. 
Categorical/ binary columns: 
Admission type columns: elective, emergency, newborn, urgent 
Marital status columns:  divorced, life partner, MARRIED, NAN, separated, single,  unknown(default ), widowed
Insurance columns:  government, Medicaid, Medicare, private, self-pay
Ethnicity columns: there are 40 ethnicity columns. :ASIAN, :WHITE, :UNKNOWN/NOT SPECIFIED, :BLACK/AFRICAN AMERICAN,...
Gender column: 1 for male, 0 for female
Dead: 1 for death, 0 otherwise
ICD9 code: column names are 3-4 digit alphanumericals,  1 if patient has disease with the ICD9 code, 0 otherwise 
Ordinal column:  
Age column: the following 10 columns are assigned 1-10 in ascending order. AGE: 0-10,  AGE: 11-20, AGE: 21-30, AGE: 31-40, AGE: 41-50, AGE: 51-60, AGE: 61-70, AGE: 71-80, AGE: 81-89, AGE: 90+
GLRM 
	Low rank model k-means is used to find clusters of similar patients. K means were  Using low rank model, the diabetes patient matrix was fitted to k-means algorithm with different k values. 
	Nnfm 
Linear Regression and Decision Tree
	Predicted LOS for patients in each cluster using other variables