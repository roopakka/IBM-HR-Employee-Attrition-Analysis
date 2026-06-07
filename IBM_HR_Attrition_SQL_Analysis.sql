CREATE DATABASE HR_ATTRITION_DB;
USE HR_ATTRITION_DB;

SELECT *
FROM `wa_fn-usec_-hr-employee-attrition`
LIMIT 10;
RENAME TABLE  `wa_fn-usec_-hr-employee-attrition` TO HR_ATTRITION
#1) Total Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_attrition;

#2) Employees Left
 select count(*) as employees_left from hr_attrition where Attrition = 'Yes';
 
 #3)Employees Who Stayed
SELECT COUNT(*) AS Employees_Stayed
FROM hr_attrition
WHERE Attrition='No';

#4)What is the overall employee attrition rate in the company?
select round(sum(case when Attrition = 'Yes' then 1 else 0 end) *100 / count(*), 2) as attrition_rate from hr_attrition;

#5)Which department has the highest number of employees who have left the company?
select Department, count(*) as Employees_left from hr_attrition where Attrition = 'Yes' group by Department order by Employees_left desc

#6)What is the attrition rate for each department in the company?
select department, round(sum(case when Attrition = 'Yes' then 1 else 0 end) *100 / count(*), 2) as attrition_rate from hr_attrition group by department order by attrition_rate desc;

#7)Which job roles experience the highest employee attrition?
select JobRole,count(*) as employee_attrition from hr_attrition where Attrition = 'Yes' group by JobRole order by employee_attrition desc;

#8)How does overtime affect employee attrition?
select OverTime, count(*) as employee_left from hr_attrition where attrition = 'yes' group by overtime;

#9)Which salary band has the highest number of employees leaving the company?
SELECT
Salary_Band,
COUNT(*) AS Employees_Left
FROM hr_attrition
WHERE Attrition='Yes'
GROUP BY Salary_Band
ORDER BY Employees_Left DESC;

#10)What is the average monthly income of employees in each department?
select department, Round(avg(MonthlyIncome),2) as average_income from hr_attrition group by department;

#11)Who are the top 10 highest-paid employees in the company?
SELECT
EmployeeNumber,
MonthlyIncome
FROM hr_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;








