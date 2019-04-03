create table scott.new_emp
select *
from scott.emp;-- 建表方式
select *
from scott.new_emp;-- 备份表格

delete
from scott.new_emp;

insert into scott.new_emp
  (EMPNO, ENAME, DEPTNO)
select EMPNO, ENAME, DEPTNO
from scott.emp;-- 在新表中插入信息

select *
from scott.new_emp;

-- 创建视图  被存储的查询  虚表
CREATE OR REPLACE view scott.v_emp -- or replace 为了方便修改查询信息
as
select ename, empno, job, DEPTNO
from scott.emp
where DEPTNO = 30;

select *
from scott.v_emp;

select ename, dname
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where ENAME = 'allen';

create or replace view scott.v_name
as
select e.ename, e.empno, d.DNAME
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;

select *
from scott.v_name
where ename = 'allen';

-- sal>scort 员工的基本信息
select *
from scott.new_emp
where  sal>(
select *
from scott.emp
where  ename='sco_tt'); -- 子查询   sub query    非相关子查询

#  DTL
#
start transaction ;--    开始一次事物
-- DML
 DELETE FROM scott.emp
where ename ='ward';
select *
from scott.emp;
rollback ;-- 回滚 回到事物开启之初 恢复数据，结束本次事物
commit ;-- 提交 信息不可以恢复，事物结束

-- DDL
create table scott.test(
 id int
);-- 隐式提交任务 commit


start transaction ;--    开始一次事物
-- DML
DELETE FROM scott.emp
where ename ='jonse';

savepoint a;-- 保留点a
update scott.emp
set sal=2000
where ename='martin';
savepoint b; -- 保留点b
select *
from scott.emp;
rollback  to a; -- 回到保留点b  不会结束事物

select *
from scott.emp;

-- DCL

-- 聚合函数
select avg(sal)
from scott.emp;

select sum(sal)
from scott.emp;

select min(sal),max(sal)
from scott.emp;

select count(sal)
from scott.emp;

select min(ename)-- 姓名最小值
from scott.emp;

select sum(ename)--结果没有意义
from scott.emp;

select  deptno ,avg(sal)
from scott.emp
group by DEPTNO;-- 把组相同的分到一起

select  JOB ,max(HIREDATE)
from scott.emp
group by JOB; -- 按工作查找最晚入职时间

select  JOB ,max(HIREDATE)
from scott.emp
group by JOB -- 按工作查找最晚入职时间
having job in('clerk','manager');-- 组检索 where/ 行检索/投影 列检索/

select abs(-1);-- 绝对值
select pi();
select rtrim('   test    ');-- 去掉右边空格
select ltrim('   test    ');
select trim('   test    ');


select  lower(ENAME)--
from scott.emp;

update  scott.emp
set ename=lower(ename);-- 变成小写

select  current_date;-- 当前日期
select now();

select date_add((now()),interval  1 week );-- 显示一周之后的时间

select dayofweek(now());-- 一周的第几天
select dayofweek('2019-3-16');

select  week((now()));-- 一年的第几周