/*
Name: Kailash Chandra Sahu
Regd No: 2161020058
Desc: Assignment 3
Branch: MCA
*/

a) select course_id, title, credits from COURSE where dept_name='Biology' or dept_name='Physics' or dept_name='Finance' or dept_name='Music';

b) select *from INSTRUCTOR where salary>65000 and name like 'K%';

c) select name, dept_name, (salary + (1.05 * salary) + (0.2 * salary)) gross_salary, ((salary + (1.05 * salary) + (0.2 * salary)) - (0.3 * salary)) net_salary from INSTRUCTOR;

d) select *from INSTRUCTOR where salary>60000 and salary<80000;

e) select *from INSTRUCTOR where name like '_r%';

f) select *from INSTRUCTOR where dept_name = 'Comp. Sci.' order by salary desc;

g) select TRUNC(94204.27348, 2) from dual;

h) select dept_name, AVG(salary) from INSTRUCTOR group by dept_name;

i) select dept_name, SUM(salary) from INSTRUCTOR group by dept_name having SUM(salary)>150000;

j) select SUM(budget) from DEPARTMENT where building = 'Watson';

k) select AVG(salary) from INSTRUCTOR where dept_name = 'Physics';

l) select AVG(salary) from INSTRUCTOR;

m) select MAX(salary) from INSTRUCTOR where dept_name = 'Comp. Sci.';

n) select COUNT(*) from INSTRUCTOR where dept_name = 'Comp. Sci.';

o) select SUM(credits) from COURSE where dept_name = 'Comp. Sci.';

p) select TO_CHAR(SYSDATE, 'DD-MON-YYYY') from dual;

q) select 5 + POWER(8, 9) from dual;
 
r) select SQRT(6464312) from dual;

s) select LOWER('HELLO ITER') from dual;

t) select INITCAP('Kailash Sahu') from dual;

u) select ROUND(2390.0038, 2) from dual;

v) select SUBSTR('Kailash Sahu', 2, 5) from dual;

w) select LENGTH('Siksha O Anusandhan') from dual;

x) alter table INSTRUCTOR add DOB date;
   update INSTRUCTOR set dob = TO_DATE('01-JAN-1991') - floor(dbms_random.value * 900);
