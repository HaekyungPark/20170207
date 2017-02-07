--테이블을 생성하면서 데이터가 insert된다
create table it_employees as(
	select * from employees where job_id = 'IT_PTOG'
);

--cf
--insert into book values((select max() from...));

select * from it_employees;

select * from employees where employee_id=104;

update EMPLOYEES 
   set salary = salary+500,
   	   commission_pct = 0.1
 where employee_id = 104;
 
 update EMPLOYEES 
    set salary = salary  + salary*0.1;

--subquery
update EMPLOYEES 
   set salary = (select max(salary) from employees);
   
rollback;

select rowid, rownum, employee_id, first_name from employees;

select rownum, employee_id, first_name from employees order by first_name asc;

select *
from (select rownum rn, a.*
from (select employee_id, first_name from employees) a)
where 5 <= rn and rn <=10;