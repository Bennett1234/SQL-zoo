--#1
SELECT Emp_First_Name, Emp_Last_Name,Country_Name, State_Name, City_Name,Emp_Mobile, Desig_Name,Designation.Desig_Id
FROM Employee_Details JOIN Country ON (Emploee_Details.Emp_Country_Id = Country.Country_Id
                      JOIN State ON (Employee_Details.Emp_State_Id = State.State_Id)
                      JOIN City ON (Employee_Details.Emp_City_Id = City.City_Id)
                      JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id)
      
--#2
SELECT State_Name, Country_Name
FROM State JOIN Country ON (State.Country_Id = Country.Country_Id)
ORDER BY State_Name ASC

--#3
SELECT Country_Name
FROM Country
ORDER BY State_Name ASC
LIMIT 3

--#4
SELECT Emp_Id
FROM Employee_Details
WHERE Emp_First_Name LIKE 'a%'

--#5
SELECT Emp_Id
FROM Employee_Details
WHERE Emp_First_Name LIKE '%a'

--#6
SELECT Emp_Id
FROM Employee_Details
WHERE Emp_Active = 0

--#7
SELECT Emp_First _Name AS First Name, Emp_Last_Name AS Last Name
FROM Employee_Details

--#8
SELECT COUNT(DISTNCT Emp_Id)
FROM Employee_Details

--#9?
SELECT COUNT(DISTNCT Emp_Id)
FROM Employee_Details
WHERE Emp_Middle_Name IS NOT NULL

--#10?
SELECT Emp_First_Name, COALESCE(Emp_Middle_Name, 'Not Applicable'), Emp_Last_Name
FROM Employee_Details

--#11
SELECT CONCAT(Emp_First_Name, Emp_Middle_Name, Emp_Last_Name)
FROM Employee_Details

--#12
SELECT *
FROM (
      SELECT *
      FROM Employee_Details JOIN Country ON (Employee_Details.Country_Id = Country.Country_Id)    
      ORDER BY Country_Name ASC
      )

--#13
SELECT *
FROM Employee_Details
ORDER BY Emp_First_Name ASC

--#14?
SELECT *
FROM Employee_Details JOIN City ON (City.City_Id = Emp_Details.City_Id)
WHERE City_Name = 'Dallas, Algiers'

--#15?
SELECT *
FROM Employee_Details JOIN City ON (City.City_Id = Emp_Details.City_Id)
WHERE City_Name LIKE 'A%' OR City_Name LIKE 'B%' OR City_Name LIKE 'C%' OR City_Name LIKE 'D%'

--#16?
SELECT Emp_First_Name, Emp_Last_Name,Country_Name, Desig_Name
FROM Employee_Details JOIN Country ON (Emploee_Details.Emp_Country_Id = Country.Country_Id
                      JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id)
WHERE Emp_DOB BETWEEN '1/2/1984' AND '3/1/1986'

--#17?
SELECT Emp_First_Name, Emp_Last_Name,Country_Name, Desig_Name,Emp_Salary
FROM Employee_Details JOIN Country ON (Emploee_Details.Emp_Country_Id = Country.Country_Id
                      JOIN Salary ON (Employee_Details.Emp_Id = Salary.Emp_Id)
                      JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id)
WHERE Emp_Salary >= ALL(SELECT Emp_Salary
                        FROM Salary
                        WHERE Emp_Salary >=0)
                        
--#18?

--#19?
SELECT Emp_First_Name, Emp_Last_Name,Country_Name, Desig_Name,Emp_Salary
FROM Employee_Details JOIN Country ON (Emploee_Details.Emp_Country_Id = Country.Country_Id
                      JOIN Salary ON (Employee_Details.Emp_Id = Salary.Emp_Id)
                      JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id) x
WHERE (Emp_Salary BETWEEN 50000 AND 100000) AND Emp_Salary >= ALL(SELECT Emp_Salary
                                                FROM Salary y
                                                WHERE y.Emp_Id = x.Employee_Details.Emp_Id)
--#20
SELECT SUBSTRING(Emp_First_Name,1,3)
FROM Employee_Details

--#21?
SELECT REPLACE(Emp_First_Name,'A','$')
FROM Emploee_Details

--#22?
SELECT datepart(year,Emp_JoinDate) AS year
       datepart(month, Emp_JoinDate) AS month
       datepart(day, Emp_JoinDate) AS day
FROM Employee_Details

--#23?
SELECT *
FROM Employee_Details
WHERE datepart(year,Emp_JoinDate) >= '2014'

--#24?
SELECT *
FROM Employee_Details
WHERE Emp_JoinDate) <= '1/1/2014'

--#25
SELECT Desig_Name, SUM(Emp_Salary)AS Total Salary
FROM Employee_Details JOIN Salary ON (Employee_Details.Emp_City_Id = Salary.Emp_Id)
                      JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id)
GROUP BY Desig_Name

--#26?
SELECT Desig_Name, COUNT(Employee_Details.Desig_Id)
FROM Employee_Details JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id)
GROUP BY Desig_Name

--#27
SELECT Desig_Name, AVG(Emp_Salary)
FROM Employee_Details JOIN Designation ON (Employee_Details.Desig_Id = Designation.Desig_Id)
                      JOIN Salary ON (Emploee_Details.Emp_Id = Salary.Emp_Id)
GROUP BY Desig_Name
ORDER BY AVG(Emp_Salary)

--#28
SELECT YEAR(Emp_JoinDate) as Joined_Year,  MONTH(Emp_JoinDate) as Joined_Month,count(Emp_id) as Number_of_employees
FROM Employee_Details
group by Emp_Id, YEAR(Emp_JoinDate), MONTH(Emp_JoinDate)
ORDER BY Joined_Year,Joined_Month

--#29?
SELECT Emp_Id
FROM Employee_Details LEFT JOIN Salary ON (Emploee_Details.Emp_Id = Salary.Emp_Id)
WHERE Emp_Salary IS NULL

--#30
SELECT Emp_First_Name, SUM(Emp_Salary)
FROM Employee_Details LEFT JOIN Salary ON (Emploee_Details.Emp_Id = Salary.Emp_Id)
GROUP BY Emp_First_Name

--#31?

--#32?

--#33

--#34
SELECT *
FROM Employee_Details LEFT JOIN Salary ON (Emploee_Details.Emp_Id = Salary.Emp_Id) x
WHERE (3-1 )= (SELECT COUNT(DISTINCT Emp_Salary)
            FROM Employee_Details LEFT JOIN Salary ON (Emploee_Details.Emp_Id = Salary.Emp_Id) y
            WHERE y.Emp_Salary > x.Emp_Salary)
--#35?

