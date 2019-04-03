show databases ;
drop database if exists db_library;
create database db_library;
drop table if exists db_library.root;
create table db_library.root
(
  id       int auto_increment primary key comment ' libraryID ',
  rootname varchar(255) not null comment 'rootname nn',
  password varchar(255) not null comment 'password nn',
  role     int(1)       not null default 0 comment 'role 0-student 1-admin nn'

) comment ' 管理员信息表';

drop table if exists db_library.book;
create table db_library.book
(
  id    int auto_increment primary key comment 'idPK',
  title varchar(255) not null comment 'book name nn'
) comment '书信息表';

drop table if exists db_library.enroll;
create table db_library.enroll
(
  id         int auto_increment primary key comment 'idPK',
  rootID   int not null comment 'root id FK',
  bookID int   not null comment 'bookID'
) comment 'enroll table';

alter table db_a.enroll
  add constraint
    enroll_fk_userID
    foreign key (rootID)
      references db_library.root (id);

alter table db_a.enroll
  add constraint
    enroll._fk_activityID
    foreign key (bookID)
      references db_library.book(id);

insert into db_library.root value (null , 'admin', md5('123'),1);
select *
from db_library.root
where rootname ='admin' and password =md5('123');

insert  into db_library.book value (null,'数据库原理');
insert  into db_library.book value (null,'数据结构');

delete from db_library.root  where id =1;

update db_library.book
set title =''
where id=1;

select *
from db_library.root;

insert into db_library.root (rootname, password) value ('tom',md5('abc') );
insert into db_library.root (rootname, password) value ('jerry',md5('def'));
insert into db_library.root(rootname, password) value ('Tester', md5('ghi'));

select *
from db_library.root
where rootname ='tom' and password =md5('abc');

insert into db_library.enroll(id, rootID, bookID) value (null, 3, 1);
insert into db_library.enroll(id, rootId, bookId) value (null, 2, 2);

select r.rootname, b.title
from db_library.root r
       inner join db_library.enroll e
                  on r.id = e.rootID
       inner join db_library.book b
                  on e.bookID = r.id;

select r.rootname, b.title
from db_library.root r
       inner join db_library.enroll e
                  on r.id = e.rootID
       inner join db_library.book b
                  on e.bookID = r.id
where a.id<>1;

select *
from db_library.book;
select *
from db_library.root;
select *
from db_library.enroll;

