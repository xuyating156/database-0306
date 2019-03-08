select *
from db_school.student;

delete from db_school.student;-- 删除表给所有信息

select *
from scott.emp;
drop table db_school.student;

select EMPNO,HIREDATE -- 查询列的信息
from scott.emp;

select distinct  JOB
from scott.emp;-- 查询唯一的job

select *
from scott.emp
where sal >2000; -- 基本工资大于2000

select *
from scott.emp
where sal <>3000; -- 不是3000

select *
from scott.emp
where sal <>2000 and  job <> 'saleman';-- 工作不是saleman and sal 不是2000

select *
from scott.emp
where ENAME = binary 'Scoot'; -- binary 区分大小写

select ENAME,HIREDATE
from scott.emp
order by ENAME  asc;-- 按员工姓名进行升序

select ENAME,HIREDATE
from scott.emp
order by ENAME  desc; -- 按姓名降序

select ENAME,HIREDATE
from scott.emp
order by ENAME  ; -- 默认升序

select ENAME,HIREDATE
from scott.emp
order by HIREDATE;-- a按工龄排序，工龄多的在前

select ENAME,job
from scott.emp
order by ENAME  ,job ;-- 先按ename  再按job

select *
from scott.emp
order by comm ;-- 排序null为最小值

