 Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
select first_name as worker_name from worker;

Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
select upper(first_name) from worker;

Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select distinct(department) from worker;

Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
select substring(first_name,1,3) from worker; 

Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
select INSTR(FIRST_NAME,BINARY 'a') FROM WORKER WHERE FIRST_NAME='Amitabh';

Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
select rtrim(first_name) from worker;

Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
select ltrim(department) from worker;

Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
select distinct(department) Department,length(department) Length from worker;

Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a','A') from worker;

 

Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single
 column COMPLETE_NAME. A space char should separate them.
 select concat(first_name,' ',last_name) Full_Name from worker;
 
 Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by first_name;

Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by first_name asc,department desc;

Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
select * from worker where first_name='Vipul' or first_name='Satish';
Select * from Worker where FIRST_NAME in ('Vipul','Satish');

Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
select * from worker where not (first_name='Vipul' or first_name='Satish');
Select * from Worker where FIRST_NAME not in ('Vipul','Satish');

Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where department='Admin';
Select * from Worker where DEPARTMENT like 'Admin%';

Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select * from  worker where first_name like '%a%';

Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’
select * from worker where first_name like '%a';

Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where first_name like '_____h';

Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;

Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
select * from worker where year(joining_date)=2014 and month(joining_date)=02;

Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) from worker where department='Admin';

Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select first_name,last_name,salary from worker where salary>=50000 and salary<=100000;
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000);

Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
select department,count(*) No_of_workers from worker 
group by department
order by No_of_workers desc;

Q-24. Write an SQL query to print details of the Workers who are also Managers.
select * from worker where worker_id in (select worker_ref_id from title where worker_title='Manager');

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE
FROM Worker W
INNER JOIN Title T
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;

Q-27. Write an SQL query to show only even rows from a table.
select * from worker where mod(worker_id,2)=0;

Q-28. Write an SQL query to clone a new table from another table.
create table worker_clone like worker;

Q-29. Write an SQL query to fetch intersecting records of two tables.
(select * from worker)
union
(select * from worker_clone); 

Q-30. Write an SQL query to show records from one table that another table does not have.
SELECT * FROM Worker w
left join Title t on w.worker_id=t.worker_ref_id;

Q-31. Write an SQL query to show the current date and time.
select curdate();
select now();

Q-32. Write an SQL query to show the top n (say 10) records of a table.
select * from worker order by salary desc limit 10;

Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT distinct Salary FROM Worker ORDER BY Salary DESC LIMIT 4,1;
-- SELECT salary FROM Employee ORDER BY Salary DESC LIMIT n-1,1

Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.
select salary from worker w1
where 4 = (select count(distinct salary) from worker w2 where w2.salary>w1.salary);

select salary from worker w1
where n-1 = (select count(distinct salary) from worker w2 where w2.salary>w1.salary);

Q-35. Write an SQL query to fetch the list of employees with the same salary.
select distinct w1.worker_id,w1.first_name,w1.last_name,w1.salary 
from worker w1 
join worker w2
 on w1.salary=w2.salary
and w1.worker_id != w2.worker_id;

Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;

Q-36. Write an SQL query to show the second highest salary from a table.
select max(salary) from worker 
where salary< 
(select max(salary) from worker);

Q-37. Write an SQL query to show one row twice in results from a table.
select worker_id,first_name from worker where department='HR'
union all
select worker_id,first_name from worker where department='HR';


Q-38. Write an SQL query to fetch intersecting records of two tables.

(SELECT * FROM Worker)
union
(SELECT * FROM Worker_Clone);

Q-39. Write an SQL query to fetch the first 50% records from a table.
select * from worker where worker_id<=(select count(*)/2 from worker);

Q-40. Write an SQL query to fetch the departments that have less than five people in it.
select department,count(*) Number_of_workers from worker group by department 
having count(*)<5 order by count(*);

Q-41. Write an SQL query to show all departments along with the number of people in there.
select department,count(*) Number_of_workers
from worker
group by department;

Q-42. Write an SQL query to show the last record from a table.
select * from worker order by worker_id desc limit 1;
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

Q-43. Write an SQL query to fetch the first row of a table.
select * from worker where worker_id=(select min(worker_id) from worker);

Q-44. Write an SQL query to fetch the last five records from a table.
select * from worker order by worker_id ASC limit 5;

SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;

Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
select first_name,max(Salary),department from worker
group by department;

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;
 
 Q-46. Write an SQL query to fetch three max salaries from a table.
 select distinct salary from worker order by salary desc limit 0,3;
 
 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
 
Q-47. Write an SQL query to fetch three min salaries from a table.
select distinct salary from worker order by salary asc limit 3; 

Q-48. Write an SQL query to fetch nth max salaries from a table.
select distinct salary from worker order by salary desc limit n;

SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department,sum(salary) Total_salary from worker 
group by department
order by salary;

Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name,last_name,salary from worker 
where salary= (select max(salary) from worker);


