show index from scott.emp;-- 显示索引
-- Mysql ,primary key & foreign key

create  index idx_ename on scott.emp(ENAME);-- 创建索引
drop index idx_ename on scott.emp;-- 删除索引

 show index from db_school.student;
select  ename
from scott.emp;

create index ind_password on db_csdn.user(password);-- 434176 kb
create index ind_username on db_csdn.user(username); -- 434176 KB
create index ind_email on db_csdn.user(email);
show index from db_csdn.user;

select  password,count(password)
from db_csdn.user
group by  password
order by 2 desc
limit 10 offset 0;

select  password,count(emal)
from db_csdn.user
group by  password
order by 2 desc
limit 10 offset 0;

select *
from user
limit 100  offset  0;

select password
from db_csdn.user
where password rlike '';

select md5 ('123');-- 密码加密 32位

