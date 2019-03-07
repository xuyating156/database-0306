-- update db_school.student set dob ='2000-1-1';  修改学生出生日期信息

show tables from db_school;
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
  major  char(2) comment '性别',
  career varchar(20) comment '专业',

departmrntID int comment '院系ID'

) comment '学生表';

select *
from db_school.student;
insert into db_school.student value (null, '002', 'Tom', 19, 1.75, '1997-01-01', '男', 'AI','1');
insert into db_school.student value (null, '003', 'Tom2', 19, 1.75, '1997-05-01', '男', 'AI','2');
insert into db_school.student value (null, '004', 'Tom3', 19, 1.75, '1997-04-01', '男', 'AI','3');


desc db_school.student; -- desc: describe

drop table if exists db_school.department;

create table db_school.department
(
  id int auto_increment primary key comment 'id PK',
  title varchar(255) comment '系院名称',
  tel varchar(255) comment  '电话'
)comment '院系表';

select *
from db_school.department;
insert into db_school.department value(null,'cs','010-1111');
insert into db_school.department value(null,'ee','010-1311');
insert into db_school.department value(null,'tf','010-1411');

select *
from db_school.department;
-- 为学生表追加外键约束 约定院系号只能在规定之内
alter table db_school.student
  add constraint
    student_fk_departmentId
    foreign key (departmentId)
      references db_school.department (id);
select *
from db_school.student;

-- 把学生表和院系表连接到一起
select s.name ,d.title
from db_school.student s
 inner join db_school.department d
on d.id=s.departmrntID;

