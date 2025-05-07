![Image](https://github.com/user-attachments/assets/819cd15d-ed52-415b-993d-3ee82aec30a5)
use Hospital
select * from [Hospital_Data]

--1.Number of Patients
Select COUNT(distinct Patient_Id ) AS No_of_Patients
from [Hospital_Data]

--2.Average Wait Time
Select AVG([Patient_Waittime]) as Avg_of_Wait_time from [Hospital_Data]

--3.Avg of Patient Satisfaction Score
Select AVG(Patient_Satisfaction_Score) as Avg_of_Wait_time from [Hospital_Data]

--4.Number of Patients Referred
Select COUNT(distinct Patient_Id ) as Number_of_Patients_Referred  from [Hospital_Data] where
Department_Referral<>'None'

--5.Patients Admitted
Select COUNT(distinct Patient_Id ) as Patients_Admitted
from [Hospital_Data] where Patient_Admission_Flag=1

--6.Patient Not Admitted
Select COUNT(distinct Patient_Id ) as Patients_Admitted
from [Hospital_Data] where Patient_Admission_Flag=0

--7.No of Patients by age group
SELECT 
    CASE 
        WHEN Patient_Age BETWEEN 0 AND 9 THEN '0-9'
        WHEN Patient_Age BETWEEN 10 AND 19 THEN '10-19'
        WHEN Patient_Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Patient_Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Patient_Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Patient_Age BETWEEN 50 AND 59 THEN '50-59'
        WHEN Patient_Age BETWEEN 60 AND 69 THEN '60-69'
        WHEN Patient_Age BETWEEN 70 AND 79 THEN '70-79'
        ELSE 'Unknown'
    END AS age_group,
    COUNT(*) AS No_of_Patients
FROM [Hospital_Data]
GROUP BY 
	CASE 
        WHEN Patient_Age BETWEEN 0 AND 9 THEN '0-9'
        WHEN Patient_Age BETWEEN 10 AND 19 THEN '10-19'
        WHEN Patient_Age BETWEEN 20 AND 29 THEN '20-29'
        WHEN Patient_Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Patient_Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Patient_Age BETWEEN 50 AND 59 THEN '50-59'
        WHEN Patient_Age BETWEEN 60 AND 69 THEN '60-69'
        WHEN Patient_Age BETWEEN 70 AND 79 THEN '70-79'
        ELSE 'Unknown'
    END
ORDER BY MIN(Patient_Age);

--8.No of Patients by Department Referral
Select Department_Referral,COUNT(*) as Number_of_Patients_Referred  from [Hospital_Data] group by
Department_Referral order by count(*) desc


--9.Percentage of Patients seen within 30min and over 30min
SELECT
    CONCAT(Round(SUM(CASE WHEN Patient_waittime <= 30 THEN 1 ELSE 0 END)*100.0/count(*),2), '%')  AS patients_within_30min,
    CONCAT(Round(SUM(CASE WHEN Patient_waittime > 30 THEN 1 ELSE 0 END)*100.0/count(*),2), '%') AS patients_over_30min
FROM [Hospital_Data]

--10.No of Patients by Gender
select Patient_Gender,count(Patient_Id) as No_of_Patients from [Hospital_Data] group by Patient_Gender order by count(*)
--No of Patients by Race
select Patient_Race,count(Patient_Id) as No_of_Patients from [Hospital_Data] group by Patient_Race order by count(*)

--11.No of Patients by week of day
select format(Patient_Admission_Date,'ddd'),
    count(*) as No_of_Patients from [Hospital_Data] 
	group by format(Patient_Admission_Date,'ddd') 

--12.Number of Patients at particular month and year
Select COUNT(distinct Patient_Id ) AS No_of_Patients
from [Hospital_Data] where month(Patient_Admission_Date)=4 and year(Patient_Admission_Date)=2024

--13.Number of Patients between particular days or months or years
Select COUNT(*) AS No_of_Patients
from [Hospital_Data] where CONVERT(DATE,Patient_Admission_Date) between '2023-04-01' and '2024-04-01'

--14.Average Wait Time at particular month and year
Select AVG([Patient_Waittime]) as Avg_of_Wait_time from [Hospital_Data] where month(Patient_Admission_Date)=4 and year(Patient_Admission_Date)=2024

--15.Average Wait Time between particular days or months or years
Select AVG([Patient_Waittime]) as Avg_of_Wait_time from [Hospital_Data] where CONVERT(DATE,Patient_Admission_Date) between '2023-04-01' and '2024-04-01'

--16.Avg of Patient Satisfaction Score at particular month and year
Select AVG(Patient_Satisfaction_Score) as Avg_of_Wait_time from [Hospital_Data] where month(Patient_Admission_Date)=4 and year(Patient_Admission_Date)=2024

--17.Avg of Patient Satisfaction Score between particular days or months or years
Select AVG(Patient_Satisfaction_Score) as Avg_of_Wait_time from [Hospital_Data] where CONVERT(DATE,Patient_Admission_Date) between '2023-04-01' and '2024-04-01'



