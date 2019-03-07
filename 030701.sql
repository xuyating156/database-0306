-- update db_school.student set dob ='2000-1-1';  修改学生出生日期信息
-- ALTER TABLE old_table_name RENAME new_table_name; 修改表名
-- ALTER TABLE table_name DROP COLUMN column_name;  删除表的一列
--  ALTER TABLE table_name  DROP FOREIGN KEY constraint_name;  删除外键
show tables from db_school;
drop database if exists db_school;
create database db_school;
-- desc db_school.student; -- desc: describe

drop table if exists db_school.student;
create table db_school.student
(
  id     int auto_increment primary key comment 'id PK',-- 主关键字约束,null为自动赋值
  -- 字段名 数据类型 [数据范围] 约束 注释，
  sno    varchar(255) unique comment '学号',
  name   varchar(20) comment '学生姓名',
  age    int(2) comment '年龄',
  height double(3, 2) not null comment '身高1.23 米',
  dob    date comment '出生年月',
  gender varchar(255) default 'male' comment '性别',
  career varchar(20) comment '专业',

  departmentID int comment '院系ID'

) comment '学生表';

alter table db_school.student auto_increment = 10000;-- 指定学生序号从10000开始

drop table if exists db_school.department;
create table db_school.department
(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) comment '系院名称',
  tel varchar(255) comment  '电话'
)comment '院系表';

-- 为学生表追加外键约束 约定院系号只能在规定之内
alter table db_school.student
  add constraint
    student_fk_departmentId -- 别名 表名 _fk_列名
    foreign key (departmentId)
      references db_school.department (id);-- 关联
#  on delete cascade;-- 级联删除
# on delete  set null ; -- 级联制空
select *
from db_school.student;

insert into db_school.student value (null, '002', 'Tom', 19, 1.75, '1997-01-01', 'male', 'AI','1');
insert into db_school.student value (null, '003', 'Tom2', 19, 1.75, '1997-05-01',null , 'AI','2');
insert into db_school.student value(sno, name, age, height, dob, departmentId) (null, '004', 'Tom3', 19, 1.75, '1997-04-01',  'AI','3');


 -- delete from db_school.department

select *
from db_school.department;
insert into db_school.department value(null,'cs','010-1111');
insert into db_school.department value(null,'ee','010-1311');
insert into db_school.department value(null,'tf','010-1411');

update  db_school.student
set gender='female',name='Tom'
where id =10000;-- 修改表的信息


delete
  from db_school.department
where id=1;
select *
from db_school.student;

-- 把学生表和院系表连接到一起
select s.name ,d.title
from db_school.student s
 inner join db_school.department d
on d.id=s.departmentID;

-- set foreign_key_checks =0;
-- set foreign_key_checks =1;


