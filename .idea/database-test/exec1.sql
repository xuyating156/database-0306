# 1. 查找部门 30 中员工的详细信息
  select *
from scott.dept
where DEPTNO=30;

# 2. 找出从事 clerk 工作的员工的编号、姓名、部门号
  select EMPNO, ENAME ,DEPTNO
from scott.emp
where JOB='clerk';

# 3. 检索出奖金多于基本工资的员工信息
  select *
from scott.emp
where SAL<COMM;

# 4. 检索出奖金多于基本工资 30% 员工信息
select *
from scott.emp
where SAL*0.3<COMM;

# 5. 希望看到 10 部门的经理或者 20 部门的职员 clerk 的信息
  select *
from scott.emp
where (DEPTNO=10 and job ='SALESMAN') or(DEPTNO=20 and JOB='clerk');

# 6. 找出 10 部门的经理、20 部门的职员或者既不是经理也不是职员但是高于 2000 元的员工信息
select *
from scott.emp
where (DEPTNO=10 and job ='SALESMAN') or(DEPTNO=20 and JOB='clerk')or (JOB<>'manager' and job<>'clerk' and sal>2000);
# 7. 找出获得奖金的员工的工作
  select  *
from scott.emp
where COMM>0;

# 8. 找出奖金少于 100 或者没有获得奖金的员工的信息
select  *
from scott.emp
where COMM<100 or comm is null ;

# 9. 查找员工雇佣日期是当月的最后一天的员工信息
select *
from scott.emp
where HIREDATE = last_day(HIREDATE);

  # 10. 检索出雇佣年限超过 35 年的员工信息
select *
from scott.emp
where date_add(HIREDATE,interval 53 year)<now();-- 入职时间加35年仍然比现在小
# 11. 找出姓名以 A、B、S 开始的员工信息
select  ENAME
from scott.emp
where substr(ENAME,1,1)IN('A','B','S') ;
# 12. 找到名字长度为 4 个字符的员工信息
select  *
from scott.emp
where ENAME=length(4);
# 13. 名字中不包含 R 字符的员工信息
select  *
from scott.emp
where ENAME not like '%R%';
# 14. 找出员工名字的前3个字符
select left(ename ,3)
from scott.emp;
# 15. 将名字中 A 改为 a
select ENAME,replace(ename ,'A','a')
from scott.emp
;


# 16. 将员工的雇佣日期拖后 10 年
select HIREDATE, date_add(HIREDATE, interval 10 year)
from scott.emp;

# 17. 返回员工的详细信息并按姓名排序
select *
from scott.emp
order by ENAME  ;
# 18. 返回员工的信息并按员工的工作年限降序排列
select *
from scott.emp
order by HIREDATE ;
# 19. 返回员工的信息并按工作降序、工资升序排列
select *
from scott.emp
order by job   desc ,sal+ifnull(comm,0) asc;
# 20. 返回员工的姓名、雇佣年份和月份，并按月份和雇佣日期排序
select ename ,year(HIREDATE),month(HIREDATE)
 from scott.emp
order by month(HIREDATE),HIREDATE;
# 21. 计算员工的日薪，每月按 30 天
select  round((sal +ifnull(comm,0))/30,2)
from scott.emp;
# 22. 找出 2 月份雇佣的员工
  select *
from scott.emp
where month(HIREDATE)=2;

# 23. 至今为止，员工被雇佣的天数
select ENAME,HIREDATE,datediff()d
from scott.emp;
# 24. 找出姓名中包含 A 的员工信息
select  *
from scott.emp
where ENAME like '%A%';
# 25. 计算出员工被雇佣了多少年、多少月、多少日


