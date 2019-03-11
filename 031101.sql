 create table scott.new_emp
select * from scott.emp;-- 建表方式
 select * from scott.new_emp;-- 备份表格

  delete from scott.new_emp;

insert into scott.new_emp
(EMPNO,ENAME,DEPTNO)
select EMPNO,ENAME,DEPTNO
from scott.emp;-- 在新表中插入信息

select *
from scott.new_emp;

-- 创建视图
 CREATE OR REPLACE view scott.v_emp -- or replace 为了方便修改信息
as
  select  ename ,empno,job ,DEPTNO
from scott.emp
where DEPTNO=30;

select *
from scott.v_emp;

