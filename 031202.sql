show databases ;
drop database if exists db_student;
create database db_student;

show tables from db_student;
drop table if exists db_student.student;
create table db_student.student(
  num   int  primary key  comment '学号',
  name varchar(20) comment '学生姓名',
  id varchar(255) comment '活动ID'
)comment '学生信息表';

insert into db_student.student value('1901','Tom','01');
insert into db_student.student value('1902','jurry','03');
insert into db_student.student value('1903','miti','02');
insert into db_student.student value('1904','summer','01');
select *from db_student.student;

drop table if exists db_student.activity;
create table db_student.activity(
  id varchar(255) unique comment '活动ID',
  cname varchar(255) comment '活动名'
)comment '活动信息表';

insert into db_student.student value('01','踏青');
insert into db_student.student value('03','划船');
insert into db_student.student value('02','植树');

drop table if exists db_student.management;
create table db_student.management(
 manum   int  primary key  comment '老师教工号',
 mapassword varchar(20) comment '老师登陆密码',
 id varchar(255)  comment '活动ID'
)comment '教师信息表';

insert into db_student.management value('1001','100111','01');
insert into db_student.management value('1002','100211','02');
insert into db_student.management value('1003','100311','03');
insert into db_student.management value('1004','100411','01');

select *
from db_student.student;
select *
from db_student.activity;
select *
from db_student.management;

