show databases;-- 显示数据库有几个
drop database if exists db_a;
create database db_a;
show tables from db_a;
drop table if exists db_a.user;
create table db_a.user
(
  id       int auto_increment primary key comment 'idPK',
  username varchar(255) not null comment 'username nn',
  password varchar(255) not null comment 'password nn',
  role     int(1)       not null default 0 comment 'role 0-student 1-admin nn'
) comment '教师信息表';

drop table if exists db_a.activity;
create table db_a.activity
(
  id    int auto_increment primary key comment 'idPK',
  title varchar(255) not null comment 'activity title nn'
) comment '活动信息表';


drop table if exists db_a.enroll;
create table db_a.enroll
(
  id         int auto_increment primary key comment 'idPK',
  time       datetime    not null default now() comment 'enroll time NN',
  userID   int not null comment 'user id FK',
  activityID int         not null comment '活动ID'
) comment 'enroll table';

alter table db_a.enroll
  add constraint
    enroll_fk_userID
    foreign key (userID)
      references db_a.user (id);

alter table db_a.enroll
  add constraint
    enroll._fk_activityID
    foreign key (activityID)
      references db_a.activity(id);

insert into db_a.user value (null , 'admin', md5('123'),1);

select *
from db_a.user
where username ='admin' and password =md5('123');

insert  into db_a.activity value (null,'植物园游');
insert  into db_a.activity value (null,'动物园游');

delete from db_a.activity  where id =1;

update db_a.activity
set title =''
where id=1;

 select *
from db_a.activity;

-- student sign up

insert into db_a.user (username, password) value ('tom',md5('abc') );
insert into db_a.user (username, password) value ('jerry',md5('def'));
insert into db_a.user(username, password) value ('Tester', md5('ghi'));

select *
from db_a.user
where username ='tom' and password =md5('abc');

#delete  from db_a.user;
#set foreign_key_checks =0;
#set foreign_key_checks =1;
#truncate db_a.user;--
insert into db_a.enroll(id, userId, activityId) value (null, 3, 2);
insert into db_a.enroll(id, userId, activityId) value (null, 2, 2);
 -- admin sing in retrieve
select u.username, a.title
from db_a.user u
       inner join db_a.enroll e
                  on u.id = e.userId
       inner join db_a.activity a
                  on e.activityId = a.id;

select u.username, a.title
from db_a.user u
       inner join db_a.enroll e
                  on u.id = e.userId
       inner join db_a.activity a
                  on e.activityId = a.id
where a.id=1;


select *
from db_a.enroll;
select *
from db_a.activity;
select *
from db_a.user;

