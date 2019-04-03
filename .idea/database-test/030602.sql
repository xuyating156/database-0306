show databases;
create database db_school;

show tables from db_school;

create table db_school.student
  (

  -- 字段名 数据类型 [数据范围] 约束 注释，
  sno    varchar(255) unique comment '学号',
  name   varchar(20) comment '学生姓名',
  age    int(2) comment '年龄',
  height double(3, 2) not null comment '身高1.23 米',
  dob    date comment '出生年月',
  major char(2)  comment '性别',
  career varchar(20) comment '专业'

) comment '学生表';

select *
from db_school.student;

insert into db_school.student value ('001', 'Tom', 19, 1.75, '1997-01-01','男','AI');
insert into db_school.student value ('002', 'Tjerry', 18, 1.75, '1997-06-01','女','物联网');
insert into db_school.student value ('003', 'Tester', 19, 1.70, '1997-03-01','男','AI');
insert into db_school.student value ('004', 'Marry', 19, 1.60, '1997-09-01','女','物联网');
select *
from db_school.student;

create table db_school.course
(
  snoclass  varchar(255) unique comment '课程号',
  nameclass varchar(20) comment '课姓名'

)comment '课程表';
insert into db_school.course value ('1901','数据库');
insert into db_school.course value ('1902','专业英语');
insert into db_school.course value ('1903','智能硬件');
insert into db_school.course value ('1904','传感器');
select *
from db_school.course;


create table db_school.sc
(
  snoclass varchar(255) unique comment '课程号',
  sno      varchar(255) unique comment '学号',
  drade    int (20) comment '成绩'
) comment '选课表';
insert into db_school.sc value ('1901','001','99');
insert into db_school.sc value ('1902','002','98');
insert into db_school.sc value ('1901','003','86');
insert into db_school.sc value ('1903','004','99');
select *
from db_school.sc;