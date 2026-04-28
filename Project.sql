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
(5, 'Lukas', 'Prochazka', 2, 3.5, '2022-05-01', NULL, 50000, 1, 2),
(6, 'Tomas', 'Cerny', 2, 6.0, '2021-02-15', NULL, 65000, 1, 2),
(7, 'Katerina', 'Vesela', 2, 4.2, '2022-08-10', NULL, 58000, 1, 2),
(8, 'Martin', 'Horak', 2, 8.5, '2019-11-01', NULL, 80000, 1, 2),
(9, 'Veronika', 'Markova', 2, 2.0, '2023-03-01', NULL, 45000, 1, 2),
(10, 'David', 'Bartos', 2, 7.3, '2020-06-15', NULL, 72000, 1, 2),
(11, 'Ondrej', 'Kucera', 2, 5.8, '2021-09-01', NULL, 68000, 1, 2),
(12, 'Petra', 'Jelinek', 2, 1.5, '2023-07-01', NULL, 42000, 1, 2),
(13, 'Michaela', 'Urbanova', 4, 4.0, '2022-01-10', NULL, 48000, 2, 4),
(14, 'Radek', 'Benes', 4, 6.5, '2020-04-01', NULL, 55000, 2, 4),
(15, 'Lucie', 'Fialova', 4, 3.2, '2022-09-01', NULL, 46000, 2, 4),
(16, 'Jakub', 'Sedlak', 4, 2.8, '2023-02-01', NULL, 44000, 2, 4),
(17, 'Simona', 'Polakova', 4, 5.5, '2021-05-15', NULL, 52000, 2, 4),
(18, 'Roman', 'Kratochvil', 3, 12.0, '2017-08-01', NULL, 95000, 1, 1),
(19, 'Alena', 'Havlickova', 3, 9.5, '2018-10-01', NULL, 88000, 2, 1),
(20, 'Filip', 'Zeman', 2, 4.7, '2021-11-01', NULL, 61000, 1, 18),
(21, 'Natalie', 'Kolarova', 2, 3.9, '2022-03-15', NULL, 57000, 1, 18),
(22, 'Pavel', 'Ruzicka', 2, 6.9, '2020-01-20', NULL, 70000, 1, 18),
(23, 'Barbora', 'Machova', 2, 2.3, '2023-06-01', NULL, 46000, 1, 18),
(24, 'Karel', 'Simek', 2, 10.0, '2016-12-01', NULL, 85000, 1, 18),
(25, 'Ivana', 'Dolezalova', 4, 7.8, '2019-03-01', NULL, 60000, 2, 19),
(26, 'Marek', 'Tichy', 4, 3.6, '2022-07-01', NULL, 47000, 2, 19),
(27, 'Adela', 'Navratilova', 4, 1.9, '2023-09-01', NULL, 42000, 2, 19),
(28, 'Jiri', 'Pavlik', 2, 5.1, '2021-04-01', NULL, 63000, 1, 18),
(29, 'Denisa', 'Blahova', 2, 2.7, '2023-01-01', NULL, 48000, 1, 18),
(30, 'Stepan', 'Kopecky', 2, 6.4, '2020-08-01', NULL, 71000, 1, 18),
(31, 'Eliska', 'Sykorova', 4, 4.9, '2021-12-01', NULL, 51000, 2, 19),
(32, 'Viktor', 'Kadlec', 2, 8.2, '2019-06-01', NULL, 78000, 1, 18),
(33, 'Kristyna', 'Pechova', 4, 3.3, '2022-10-01', NULL, 46000, 2, 19),
(34, 'Daniel', 'Hruska', 2, 7.0, '2020-02-01', NULL, 73000, 1, 18);

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
