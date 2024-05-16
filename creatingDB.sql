-- Create a database for this schema

CREATE DATABASE mysql_practice;

-- To Ensure we're using the database we created, we'll input USE

USE mysql_practice;

-- Create tables within the database based on the information that was provided. 2 tables: employee & reward

CREATE TABLE employee (
	Employee_id INT NOT NULL AUTO_INCREMENT, -- auto_increment will assign each new data an int starting from 1
    First_name VARCHAR(30),
    Last_name VARCHAR(30),
    Salary INT,
    Joining_date DATE,
    Department VARCHAR(20),
    PRIMARY KEY(Employee_id)
);

CREATE TABLE reward (
	Employee_ref_id INT,
    date_reward DATE,
    amount INT,
    FOREIGN KEY (Employee_ref_id) REFERENCES employee(Employee_id) -- This foreign key is soo that we can connect the two tables together to get information from both tables in one query!
);

-- Input data into the two tables following the format of the information from top to bottom. Lets start with the employees information first

INSERT INTO employee (First_name, Last_name, Salary, Joining_date, Department)
VALUES ('Bob', 'Kinto', 1000000, "2019-01-20", "Finance"),
('Jerry', 'Kansxo', 6000000, "2019-01-15", "IT"),
('Philip', 'Jose', 8900000, "2019-02-05", "Banking"),
('John', 'Abraham', 2000000, "2019-02-25", "Insurance"),
('Michael', 'Mathew', 2200000, "2019-02-28", "Finance"),
('Alex', 'chreketo', 4000000, "2019-05-10", "IT"),
('Yohan', 'Soso', 1230000, "2019-06-20", "Banking");

-- Now we'll move onto the reward table

INSERT INTO reward (Employee_ref_id, date_reward, amount)
VALUES (1, '2019-05-11', '1000'),
(2, '2019-02-15', '5000'),
(3, '2019-04-22', '2000'),
(1, '2019-06-20', '8000');

-- Now that we set up the DB, input tables (employee, reward) and input information within those tables, we can now begin to answer some questions! :)