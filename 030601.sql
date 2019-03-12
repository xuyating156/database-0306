 -- sql 命令式语言
# ctrl+enter
show databases;
create database db_school;

show tables from db_school;

create table db_school.student(

  -- 字段名 数据类型 [数据范围] 约束 注释，
  sno varchar(255) unique comment '学号',
  name varchar(20) comment '学生姓名',
  age int(2) comment '年龄',
  height double(3,2) not null comment '身高1.23 米',
  dob date comment '出生年月'
   ) comment'学生表';

 select *from db_school.student;

insert into db_school.student value('001','Tom',19,1.75,'1997-01-01');
insert into db_school.student value('002','Tjerry',18,1.75,'1997-06-01');
insert into db_school.student value('003','Tester',19,1.70,'1997-03-01');
 insert into db_school.student value('004','Marry',19,1.60,'1997-09-01');
 select *from db_school.student;


delete from db_school.student;
 select *from db_school.student;
drop table db_school.student;

drop database db_school;

