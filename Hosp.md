#### To view table use below Query 
**select * from [Hospital_Data]**  
![Image](https://github.com/user-attachments/assets/0317ecb5-f072-462f-bd33-0ad20a2b2bf2)  

**1.Number of Patients**  
**Query**  
Select COUNT(distinct Patient_Id ) AS No_of_Patients from [Hospital_Data]  
**Result**  
![Image](https://github.com/user-attachments/assets/cc2b88e2-56a9-44db-bd70-86fdfaad66b5)  

**2.Average Wait Time**    
Select AVG([Patient_Waittime]) as Avg_of_Wait_time from [Hospital_Data]  
![Image](https://github.com/user-attachments/assets/1c0a9eae-570b-4457-a923-0edae4f54bee)

**3.Avg of Patient Satisfaction Score**  
Select AVG(Patient_Satisfaction_Score) as Avg_of_Wait_time from [Hospital_Data]
![Image](https://github.com/user-attachments/assets/b7bb3f74-3287-4737-8ebc-a882da0f4a54)

**4.Number of Patients Referred**  
Select COUNT(distinct Patient_Id ) as Number_of_Patients_Referred  from [Hospital_Data] where
Department_Referral<>'None'
![Image](https://github.com/user-attachments/assets/d7dc0587-f7df-4d2b-8ddf-744db4db5a3a)

**5.Patients Admitted** 
Select COUNT(distinct Patient_Id ) as Patients_Admitted
from [Hospital_Data] where Patient_Admission_Flag=1
![Image](https://github.com/user-attachments/assets/e273d455-bcfc-489c-b51e-214e0c55bb94)

**6.Patient Not Admitted**  
Select COUNT(distinct Patient_Id ) as Patients_Admitted
from [Hospital_Data] where Patient_Admission_Flag=0
![Image](https://github.com/user-attachments/assets/9301847c-66d9-4006-a66a-7f8418721e82)

**7.No of Patients by age group**  
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
![Image](https://github.com/user-attachments/assets/58918d0d-5010-4c34-80c8-f42e5e886c0b)

**8.No of Patients by Department Referral**  
Select Department_Referral,COUNT(*) as Number_of_Patients_Referred  from [Hospital_Data] group by
Department_Referral order by count(*) desc
![Image](https://github.com/user-attachments/assets/230d04b0-22ef-4115-b60f-9796a375eef0)


**9.Percentage of Patients seen within 30min and over 30min** 
SELECT
    CONCAT(Round(SUM(CASE WHEN Patient_waittime <= 30 THEN 1 ELSE 0 END)*100.0/count(*),2), '%')  AS patients_within_30min,
    CONCAT(Round(SUM(CASE WHEN Patient_waittime > 30 THEN 1 ELSE 0 END)*100.0/count(*),2), '%') AS patients_over_30min
FROM [Hospital_Data]
![Image](https://github.com/user-attachments/assets/0902f739-0365-4167-9f8d-6d27d613c0d9)

**10.No of Patients by Gender**  
select Patient_Gender,count(Patient_Id) as No_of_Patients from [Hospital_Data] group by Patient_Gender order by count(*)
--No of Patients by Race
select Patient_Race,count(Patient_Id) as No_of_Patients from [Hospital_Data] group by Patient_Race order by count(*)
![Image](https://github.com/user-attachments/assets/a6c35f6d-6ede-48ad-843a-84b20b9cbb41)

**11.No of Patients by week of day**  
select format(Patient_Admission_Date,'ddd'),
    count(*) as No_of_Patients from [Hospital_Data] 
	group by format(Patient_Admission_Date,'ddd') 
 ![Image](https://github.com/user-attachments/assets/3c75aad7-1687-4fba-88df-36aadc267c4d)

**12.Number of Patients at particular month and year**  
Select COUNT(distinct Patient_Id ) AS No_of_Patients
from [Hospital_Data] where month(Patient_Admission_Date)=4 and year(Patient_Admission_Date)=2024

**13.Number of Patients between particular days or months or years**  
Select COUNT(*) AS No_of_Patients
from [Hospital_Data] where CONVERT(DATE,Patient_Admission_Date) between '2023-04-01' and '2024-04-01'

**14.Average Wait Time at particular month and year**  
Select AVG([Patient_Waittime]) as Avg_of_Wait_time from [Hospital_Data] where month(Patient_Admission_Date)=4 and year(Patient_Admission_Date)=2024

**15.Average Wait Time between particular days or months or years**  
Select AVG([Patient_Waittime]) as Avg_of_Wait_time from [Hospital_Data] where CONVERT(DATE,Patient_Admission_Date) between '2023-04-01' and '2024-04-01'

**16.Avg of Patient Satisfaction Score at particular month and year**  
Select AVG(Patient_Satisfaction_Score) as Avg_of_Wait_time from [Hospital_Data] where month(Patient_Admission_Date)=4 and year(Patient_Admission_Date)=2024

**17.Avg of Patient Satisfaction Score between particular days or months or years** 
Select AVG(Patient_Satisfaction_Score) as Avg_of_Wait_time from [Hospital_Data] where CONVERT(DATE,Patient_Admission_Date) between '2023-04-01' and '2024-04-01'



