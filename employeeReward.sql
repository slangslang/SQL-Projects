-- PART 1

-- 1. Get all employees.

SELECT *
FROM employee;

-- 2. Display the first name and last name of all employees.

SELECT First_name, Last_name
FROM employee;

-- 3. Display all the values of the “First_Name” column using the alias “Employee Name”

SELECT First_name AS 'Employee Name'
FROM employee;

-- 4. Get all “Last_Name” in lowercase.

SELECT LOWER(Last_name)
FROM employee;

-- 5. Get all “Last_Name” in uppercase.

SELECT UPPER(Last_name)
FROM employee;

-- 6. Get unique “DEPARTMENT”.

SELECT DISTINCT(Department)
FROM employee;

-- 7. Get the first 4 characters of “FIRST_NAME” column.

SELECT SUBSTRING(First_name, 1, 4) AS onlyFour
FROM employee;

-- 8. Get the position of the letter ‘h’ in John.

SELECT POSITION('h' IN 'John') AS matchPosition
FROM employee
WHERE First_name = 'John';

-- 9. Get all values from the “FIRST_NAME” column after removing white space on the right.

SELECT RTRIM(First_name) AS rightTrim
FROM employee;

-- 10. Get all values from the “FIRST_NAME” column after removing white space on the left.

SELECT LTRIM(First_name) AS leftTrim
FROM employee;

-- 11. Write the syntax to create the employee table

CREATE TABLE employee (
	Employee_id INT NOT NULL,
    First_name VARCHAR(20) NULL,
    Last_name VARCHAR(20) NULL,
    Salary DECIMAL(18, 0) NULL,
    Joining_date DATE,
    Department VARCHAR(20) NULL,
    PRIMARY KEY(Employee_id)
);

-- PART 2

-- 1. Get the length of the text in the 'First_name' column

SELECT CHAR_LENGTH(First_name)
FROM employee;

-- 2. Get the employee's first name after replacing 'o' with '#'

SELECT REPLACE(First_name, 'o', '#') AS nameChange
FROM employee;

-- 3. Get the employee's last name and first name in a single column seperated by a '_'

SELECT CONCAT(Last_name, '_', First_name) AS 'Employee Name'
FROM employee;

-- 4. Get the year, month, and date from the 'Joining_date' column

SELECT DATE_FORMAT(Joining_date, '%Y %M %d') AS 'Date of join'
FROM employee;

SELECT YEAR(Joining_date) AS YEAR, MONTH(Joining_date) AS MONTH, DAY(Joining_date) AS DAY
FROM employee;

-- 5. Get all employees in ascending order by first name

SELECT *
FROM employee
ORDER BY First_name ASC;

-- 6. Get all employees in descending order by first name

SELECT *
FROM employee
ORDER BY First_name DESC;

-- 7. Get all employees in ascending order by first name and descending order by salary

SELECT *
FROM employee
ORDER BY First_name ASC, Salary DESC;

-- 8. Get employees whose first name is 'bob'

SELECT *
FROM employee
WHERE First_name = 'bob';

-- 9. Get employees whose first name is 'bob' or 'alex'

SELECT *
FROM employee
WHERE First_name = 'bob' OR First_name = 'alex';

-- OR 

SELECT *
FROM employee
WHERE First_name IN ('bob', 'alex');

-- 10. Get employees whose first name is neither 'bob' nor 'alex'

SELECT *
FROM employee
WHERE First_name != 'bob' AND First_name != 'alex';

-- OR

SELECT *
FROM employee
WHERE First_name NOT IN ('bob', 'alex');



-- PART 3

-- 1. Get all the details about employees whose first name begins with 'B'

SELECT *
FROM employee
WHERE First_name LIKE 'B%';

-- 2. Get all the details about employees whose first name contains 'o'

SELECT *
FROM employee
WHERE First_name LIKE '%o%';

-- 3. Get all the details of the employees whose first name ends with 'n'

SELECT *
FROM employee
WHERE First_name LIKE '%n';

-- 4. Get all the details about employees whose first name ends with 'n' and contains 4 letters

SELECT *
FROM employee
WHERE First_name LIKE '___n';

-- 5. Get all the details about employees whose first name begins with 'j' and contains 4 letters

SELECT *
FROM employee
WHERE First_name LIKE 'J___';

-- 6. Get all the details of employees whose salary is over 3,000,000

SELECT *
FROM employee
WHERE salary > 3000000;

-- 7. Get all the details about employees whose salary is less than 3,000,000

SELECT *
FROM employee
WHERE salary < 3000000;

-- 8. Get all the details about employees with a salary between 2,000,000 and 5,000,000

SELECT *
FROM employee
WHERE salary BETWEEN 2000000 AND 5000000;

-- 9. Get all the details about employees whoes first name is 'bob' or 'alex'

SELECT *
FROM employee
WHERE First_name IN ('bob', 'alex');

-- 10. Get all the details about employees whoe joining year is '2019'

SELECT *
FROM employee
WHERE YEAR(Joining_date) = 2019;



-- PART 4

-- 1. Get all the details on employees whose participation month (Joining_date) is “January”

SELECT *
FROM employee
WHERE MONTH(Joining_date) = 01;

-- 2. Get all the details of the employees who joined before March 1, 2019

SELECT *
FROM employee
WHERE Joining_date < 20190301;

-- 3. Get all the details on employees who joined after March 31, 2019

SELECT *
FROM employee
WHERE Joining_date > 20190331;

-- 4. Get the date and time of the employee’s enrollment.

SELECT TIMESTAMP(Joining_date) AS employee_enrollment
FROM employee;

-- 5. Get the date and time, including milliseconds of the employee’s membership.

SELECT CONCAT(DATE(Joining_date), ' ', TIME_FORMAT(Joining_date, '%H %i %s %f')) AS employees_membership
FROM employee;

-- OR

SELECT microsecond(Joining_date)
FROM employee;

-- 6. Get the difference between the “Joining_date” and “date_reward” column

SELECT r.date_reward - e.joining_date
FROM employee e
JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 7. Get the current date and time.

SELECT NOW();

-- 8. Get the first names of employees who have the character ‘%’. Example: ‘Jack%’.

SELECT First_name
FROM employee
WHERE First_name LIKE '%\%%';

-- 9. Get the employee name (Last_name) after replacing the special character with white space.

SELECT REPLACE(Last_name, '%', ' ')
FROM employee;

-- 10. Get the employee’s department and total salary, grouped by department.

SELECT Department, SUM(Salary) AS total
FROM employee
GROUP BY Department;



-- PART 5



-- 1. Get the department and total salary, grouped by department, and sorted by total salary in descending order.

SELECT Department, SUM(Salary) AS total
FROM employee
GROUP BY Department
ORDER BY total DESC;

-- 2. Get the department, the number of employees in that department, and the total salary grouped by department, and sorted by total salary in descending order.

SELECT Department, COUNT(Employee_id) num_employees, SUM(Salary) AS total
FROM employee
GROUP BY Department
ORDER BY total DESC;

-- 3. Get the average salary by department in ascending order of salary.

SELECT Department, AVG(Salary) AS average
FROM employee
GROUP BY Department
ORDER BY average;

-- 4. Get the maximum salary by department in ascending order of salary.

SELECT Department, MAX(Salary) AS max
FROM employee
GROUP BY Department
ORDER BY max;

-- 5. Get the minimum salary by department in ascending order of salary.

SELECT Department, MIN(Salary) AS min
FROM employee
GROUP BY Department
ORDER BY min;

-- 6. Get the number of employees grouped by year and month of membership.

SELECT COUNT(Employee_id)
FROM employee
GROUP BY YEAR(Joining_date) + MONTH(Joining_date);

-- 7. Get the department and total salary grouped by the department, where the total salary is greater than 1,000,000, and sorted in descending order of the total salary.

SELECT Department, SUM(Salary) AS total
FROM employee
WHERE Salary > 1000000
GROUP BY Department
ORDER BY total DESC;

-- 8. Get all the details of an employee if the employee exists in the Reward table? Or in other words, find employees with bonuses.

SELECT *
FROM employee e
RIGHT JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 9. Get the IDs of employees who did not receive rewards?

SELECT e.Employee_id, CONCAT(e.First_name, ' ', e.Last_name) AS employeeName, r.amount
FROM employee e
LEFT JOIN reward r
ON e.Employee_id = r.Employee_ref_id
WHERE r.Employee_ref_id IS NULL;



-- PART 6



-- 1. Get 20% of Bob’s salary, 10% of Alex’s salary, and 15% of other employees’ salaries.

SELECT CONCAT(First_name, '_', Last_name) AS employeeName,
CASE
	WHEN e.First_name = 'Bob' THEN Salary * .20
    WHEN e.First_name = 'Alex' THEN Salary * .10
    ELSE Salary * .15
END AS employeeSalaries
FROM employee e
ORDER BY Salary DESC;

-- 2. Display the text

-- ‘IT services’ instead of ‘IT’,
-- ‘Financial services’ instead of ‘Finance’, and
-- ‘Banking services’ instead of ‘Banking’
-- from the “Department” column.

SELECT Department,
CASE
	WHEN Department = 'IT' THEN 'IT services'
    WHEN Department = 'Finance' THEN 'Financial services'
    WHEN Department = 'Banking' THEN 'Banking services'
END AS Department_update
FROM employee;

-- 3. Remove employees who have received rewards.

DELETE FROM employee
WHERE Employee_id IN (
	SELECT Employee_ref_id
    FROM reward
);

-- 4. Insert employee whose name contains a single quote '

INSERT INTO employee 
value("Alex'");

-- 5. Get the name of the employees which contains only numbers.

SELECT *
FROM employee
WHERE LOWER(Last_name) = UPPER(Last_name);

-- 6. Classify employees according to their reward for one month.

SELECT CONCAT(e.First_name, ' ', e.Last_name) AS employeeName, r.amount,
RANK () OVER (
	ORDER BY r.amount DESC
) AS ranking
FROM employee e
JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 7. Update the reward of “Bob” to 1000.

UPDATE reward
SET amount = '1000'
WHERE Employee_ref_id IN (
	SELECT First_name
	FROM employee
	WHERE First_name = 'Bob'
);

-- 8. Get the first name, the amount of the reward for the employees who have rewards.

SELECT e.First_name, r.amount
FROM employee e
RIGHT JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 9. Get the first name, the reward amount for employees who have rewards with an amount greater than 2000.

SELECT e.First_name, r.amount
FROM employee e
RIGHT JOIN reward r
ON e.Employee_id = r.Employee_ref_id
WHERE r.amount > 2000;

-- 10. Get the first name, the amount of the reward for the employees even if they have not received any rewards.

SELECT e.First_name, r.amount
FROM employee e
LEFT JOIN reward r
ON e.Employee_id = r.Employee_ref_id;



-- PART 7



-- 1. Get the first name, the reward amount for employees even if they did not receive any rewards, 
-- and set a reward amount equal to 0 for the employees who did not receive rewards.

SELECT e.First_name, IFNULL(r.amount,0) AS amount
FROM employee e
LEFT JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 2. Get the employee’s first name, the reward amount for employees who have rewards.

SELECT e.First_name, r.amount
FROM employee e
RIGHT JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 3. Get the first name, the reward amount for employees who have rewards using “Right Join”.

SELECT e.First_name, IFNULL(r.amount, 0) AS amount
FROM employee e
RIGHT JOIN reward r
ON e.Employee_id = r.Employee_ref_id;

-- 4. Get the maximum reward per employee using subquery.

SELECT Department,
(
	SELECT IFNULL(MAX(amount),0)
    FROM reward
    WHERE Employee_ref_id = Employee_id 
) AS max_reward
FROM employee;

-- 5. Get the TOP salary of two employees

SELECT CONCAT(First_name, ' ', Last_name) AS employeeName, SUM(Salary) AS total_salary
FROM employee
GROUP BY employeeName
ORDER BY total_salary DESC
LIMIT 2;

-- OR

SELECT *
FROM employee
ORDER BY Salary DESC
LIMIT 2;
