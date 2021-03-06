# 1. 返回拥有员工的部门名、部门号
select distinct d.dname ,d.DEPTNO-- 显示不重复
from scott.emp e
       inner join scott.dept d              -- 两个表联合查询的条见
                  on e.DEPTNO = d.DEPTNO;

# 2. 工资多于 scott 的员工信息
select *
from scott.emp
where (SAL + ifnull(COMM, 0)) > (
  select (SAL + ifnull(COMM, 0))
  from scott.emp
  where ENAME = 'sco_tt'
);

# 3. 返回员工和所属经理的姓名
  select el.ENAME,e2.ENAME
from scott.emp el
  join scott.emp e2
on e2.MGR=e2.DEPTNO;
# 4. 返回雇员的雇佣日期早于其经理雇佣日期的员工及其经理姓名
select el.ENAME,e2.ENAME
from scott.emp el
       join scott.emp e2
            on e2.MGR=e2.EMPNO
           where e2.MGR<e2.DEPTNO;
# 5. 返回员工姓名及其所在的部门名称
select e.ename ,d.dname
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO;
# 6. 返回从事 clerk 工作的员工姓名和所在部门名称
select e.ename ,d.dname
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where JOB='clerk';
# 7. 返回部门号及其本部门的最低工资
select  DEPTNO ,min (SAL+ifnull(comm,0))
from scott.emp
group by DEPTNO;

# 8. 返回销售部 sales 所有员工的姓名
select e.ename
from scott.emp e
       inner join scott.dept d
                  on e.DEPTNO = d.DEPTNO
where DNAME='sales';

# 9. 返回工资多于平均工资的员工
select *
from  scott.emp
where SAL+ifnull(comm,0)>(
select avg(sal +ifnull (comm,0))
  from scott.emp
  );

# 10. 返回与 scott 从事相同工作的员工
select ENAME
from scott.emp
where JOB=(
  select job
  from scott.emp
  where ENAME='sco_tt'
  );
# 11. 返回比 30 部门员工平均工资高的员工姓名与工资
select ename ,SAL
from scott.emp
where SAL+ifnull(comm,0)>(
  select avg(SAL)
  from scott.emp
  where DEPTNO='30'
  );
# 12. 返回工资高于30部门所有员工工资水平的员工信息
select ename ,SAL
from scott.emp
where SAL>(
  select max(SAL)
  from scott.emp
  where DEPTNO='30'
);
# 13. 返回部门号、部门名、部门所在位置及其每个部门的员工总数
select d.DEPTNO,d.DNAME,d.LOC,count(e.ENAME)
from scott.emp e
  right   join scott.dept d
  on e.DEPTNO = d.DEPTNO
    group by d.DEPTNO;




# 14. 返回员工的姓名、所在部门名及其工资
select e.SAL+ifnull(comm,0),e.ENAME,d.DNAME
from  scott.emp e
        inner join scott.dept d
                   on e.DEPTNO = d.DEPTNO;
# 15. 返回雇员表中不在同一部门但是从事相同工作的员工信息
select e1.ENAME,e2.ENAME
from scott.emp e1
join scott.emp e2
where e1.DEPTNO<>e2.DEPTNO
and e1.JOB=e2.JOB;



# 16. 返回员工的详细信息，包括部门名
select e.*,d.DNAME
from  scott.emp e
         join scott.dept d
                   on e.DEPTNO = d.DEPTNO;
# 17. 返回员工工作及其从事此工作的最低工资
select  JOB ,min(sal +ifnull(comm,0))
from scott.emp
group by JOB;
# 18. 返回不同部门经理的最低工资
select DEPTNO, min(sal +ifnull(comm,0))
from scott.emp
where job='manager'
group by DEPTNO;
# 19. 计算出员工的年薪，并且以年薪排序
select (sal +ifnull(comm,0))*12
from scott.emp
order by 1;

# 20. 返回工资处于第 4 级别的员工的姓名
select e.ENAME,s.GRADE
from scott.salgrade s
join scott.emp e
on e.sal+ifnull(comm,0) between s.LOSAL and s.HISAL
where s.GRADE=4;