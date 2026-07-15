CREATE TABLE Employees1(
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50),
    experience INT
);

INSERT INTO Employees1 VALUES
(101, 'Rahul', 'IT', 75000, 'Hyderabad', 5),
(102, 'Anjali', 'HR', 45000, 'Chennai', 3),
(103, 'Kiran', 'IT', 82000, 'Bangalore', 6),
(104, 'Sneha', 'Finance', 67000, 'Hyderabad', 4),
(105, 'Aman', 'HR', 39000, 'Pune', 2),
(106, 'Ravi', 'Finance', 91000, 'Mumbai', 8),
(107, 'Divya', 'IT', 55000, 'Chennai', 3),
(108, 'Meena', 'Sales', 48000, 'Bangalore', 2),
(109, 'Arjun', 'Sales', 61000, 'Hyderabad', 5),
(110, 'Pooja', 'IT', 73000, 'Mumbai', 4),
(111, 'Vikas', 'HR', 52000, 'Pune', 3),
(112, 'Nisha', 'Finance', 88000, 'Bangalore', 7),
(113, 'Tarun', 'Sales', 46000, 'Chennai', 2),
(114, 'Kavya', 'IT', 97000, 'Hyderabad', 9),
(115, 'Manoj', 'Finance', 58000, 'Mumbai', 4);


select * from Employees1;

select emp_name,salary from Employees1;

select emp_name,department from Employees1;

select emp_name,department from Employees1 
where department='IT';

select emp_name,department from Employees1;


select emp_name,experience from Employees1;


select * from Employees1
where salary>70000;

select * from Employees1
where city='Hyderabad';


select * from Employees1
where city='Hyderabad';



select * from Employees1
where experience<=4;


select * from Employees1
where department='Finance';


select * from Employees1
where salary=52000;

select department,sum(salary) as totalsalary from Employees1
group by department;

select department,avg(salary) as avgsalary from Employees1
group by department;

select city,count(emp_id) as employeecount from Employees1
group by city;

select department,max(salary) as maxsalary from Employees1
group by department;

select department,min(experience) as minexperience from Employees1
group by department;

  

select city,count(emp_id) as employeecount from Employees1
group by city
having count(emp_id) >3;

select department,avg(salary) as avgsalary from Employees1
group by department
having avg(salary)>60000;

select city,count(emp_id) as employeecount from Employees1
group by city
having count(emp_id) >2;

select department,sum(salary) as totalsalary from Employees1
group by department
having sum(salary)>200000;

select department,max(salary) as maxsalary from Employees1
group by department
having max(salary)>90000;

select top 5 * from Employees1
ORDER BY salary DESC;

select top 3 * from Employees1
order by experience desc;

select top 2 *from Employees1
where department = 'Finance'
order by salary desc;

select top 4 * 
from Employees1;

select top 1 * from Employees1
ORDER BY salary DESC;

select distinct  department from Employees1;

select distinct  city from Employees1;

select distinct  salary  from Employees1;

select distinct  department,city from Employees1;

select distinct  experience from Employees1;

select * from Employees1
where salary>=80000;

select * from Employees1
where experience<=3;

select * from Employees1
where salary<>45000;

select * from Employees1
where salary<50000;

select * from Employees1
where experience>5;


select * from Employees1
where department='IT'
AND salary>70000;


select * from Employees1
where city='Hyderabad'
OR city='Bangalore';

select * from Employees1
where department='HR'AND experience<3;

select * from Employees1
where salary>60000 OR experience>6;


select * from Employees1
where department <> 'Sales';
select * from Employees1
where department != 'Sales';


select * from Employees1
where city IN ('Hyderabad', 'Mumbai');

select * from Employees1
where department NOT IN ('IT', 'Finance');


select * from Employees1
where city NOT IN ('Chennai', 'Pune');


select * from Employees1
where salary IN (45000, 75000, 91000);

select * from Employees1
where department NOT IN ('HR', 'Sales');

select * from Employees1
where salary BETWEEN 50000 AND 80000;

select * from Employees1
where salary BETWEEN 50000 AND 80000;


select * from Employees1
where  experience BETWEEN 3 AND 6;

select * from Employees1
where emp_id BETWEEN 105 AND 112;

select * from Employees1
where salary NOT BETWEEN 40000 AND 60000;

select * from Employees1
where experience BETWEEN 2 AND 4;

SELECT *
FROM Employees1
WHERE emp_name LIKE 'R%';

SELECT *
FROM Employees1
WHERE emp_name LIKE '%a';

SELECT *
FROM Employees1
WHERE emp_name LIKE '%v%';

SELECT *
FROM Employees1
WHERE city LIKE 'B%';

SELECT *
FROM Employees1
WHERE department LIKE '%s';





















