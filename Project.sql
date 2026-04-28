-- creating table and relations
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role_id INT,
    experience_years DECIMAL(4,1),
    start_date DATE,
    contract_until DATE,
    salary DECIMAL(10,2),
    team_id INT,
    supervisor_id INT,

    FOREIGN KEY (role_id) REFERENCES Roles(role_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (supervisor_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    is_management BOOLEAN
);

CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(50),
    department_id INT,
    team_lead_id INT,
    created_at DATE,

    FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    FOREIGN KEY (team_lead_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    budget DECIMAL(12,2),
    location VARCHAR(100),
    created_at DATE
);

-- inserting people

INSERT INTO Departments VALUES
(1, 'IT', 500000, 'Prague', '2020-01-01'),
(2, 'HR', 200000, 'Brno', '2021-06-01');

INSERT INTO Roles VALUES
(1, 'CEO', 100000, 300000, TRUE),
(2, 'Developer', 40000, 90000, FALSE),
(3, 'Manager', 60000, 120000, TRUE),
(4, 'HR Specialist', 30000, 70000, FALSE);

INSERT INTO Employees (
    employee_id, first_name, last_name, role_id,
    experience_years, start_date, contract_until,
    salary, team_id, supervisor_id
) VALUES
(1, 'Jan', 'Novak', 1, 20, '2015-01-01', NULL, 200000, NULL, NULL),
(2, 'Petr', 'Svoboda', 3, 10, '2018-03-01', NULL, 90000, NULL, NULL),
(3, 'Anna', 'Kralova', 2, 5, '2020-07-01', NULL, 60000, NULL, NULL),
(4, 'Eva', 'Dvorakova', 4, 7, '2019-09-01', NULL, 50000, NULL, NULL);

INSERT INTO Teams VALUES
(1, 'Backend Team', 1, 2, '2022-01-01'),
(2, 'HR Team', 2, 4, '2022-02-01');

UPDATE Employees SET team_id = 1, supervisor_id = 2 WHERE employee_id = 3;
UPDATE Employees SET team_id = 2, supervisor_id = 4 WHERE employee_id = 4;
UPDATE Employees SET supervisor_id = 1 WHERE employee_id = 2;

-- filtering

SELECT * FROM Employees WHERE salary > 70000;

-- sorting

SELECT * FROM Employees ORDER BY experience_years DESC;


-- UPDATE

UPDATE Employees SET salary = 65000 WHERE employee_id = 3;

-- delete

DELETE FROM Employees WHERE employee_id = 4;

-- Join / inner join, rows where match exists on both sides

SELECT e.first_name, e.last_name, r.role_name, t.team_name
FROM Employees e
JOIN Roles r ON e.role_id = r.role_id
JOIN Teams t ON e.team_id = t.team_id;

SELECT e.first_name, t.team_name
FROM Employees e
INNER JOIN Teams t ON e.team_id = t.team_id;

-- left join, ALL rows from the left table matched with right side, if no match NULL

SELECT e.first_name, t.team_name
FROM Employees e
LEFT JOIN Teams t ON e.team_id = t.team_id;

-- right join, ALL rows from the right table matched with left side, if no match NULL

SELECT e.first_name, t.team_name
FROM Employees e
RIGHT JOIN Teams t ON e.team_id = t.team_id;

-- full join, all rows on both sides, matches - good, if not NULL

SELECT e.first_name, t.team_name
FROM Employees e
FULL JOIN Teams t ON e.team_id = t.team_id;