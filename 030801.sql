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

select  *
from scott.emp
limit 3 offset 0;-- 限制   偏移量  查询从0条开始后三条
-- limit 0,3;   简写 0-3  不建议使用  limit 一般位于 order by 之后

-- sql like  模糊查询
select *
from scott.emp
where ename like 'a%';-- 查询a 开头的员工的姓名

select *
from scott.emp
where ename like '%a';-- 查询a 结尾的员工的姓名

select *
from scott.emp
where ename not  like 'a%s';-- 查询  不是a 开头同时不是以 s 结尾的员工的姓名

select *
from scott.emp
where ename not  like '_coot'; --  下划线_ 表示一个字符

select *
from scott.emp
where ENAME like '%\_%' escape '\\'; -- 查询含有下划线的名字

update scott.emp
set ename ='sco_tt'
where ename ='scott';

select *
from scott.emp
where job='salesman' or job ='manager' or job='president';

select *
from scott.emp
where job in('salesman','manager','president');-- 简写


select *
from scott.emp
where sal >=2000 and sal<=3000;-- [2000-3000]
# where sal between 2000 and 3000;  -- 工资在2000-3000

select ename as  员工姓名-- 给姓名列其别名
from scott. emp as e ;

select *
from scott.emp
where comm is not  null ;-- 查询奖金为null的数据 判断为null

update scott. emp
set comm = null
where ename ='7499';-- 修改奖金为null 设置为mull

select  ename ,sal+ifnull (comm,0) -- 第一个数为空，取第二个数，若第二个数为空 取第一个数，
from  scott.emp;



