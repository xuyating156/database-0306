drop database if exists db_ip;
create database db_ip;

drop table if exists db_ip.ip;
create table db_ip.ip
(
  id  int auto_increment primary key comment 'id PK',
  min varchar(255) not null comment 'min ip NN',
  max varchar(255) not null comment 'max ip NN',
  loc varchar(255) not null comment 'location NN'
) comment 'ip address table';

load data local infile 'd:/ip.txt'
  into table db_ip.ip
  fields terminated by '|'
  (min, max, loc)
  set id = null;

select *
from db_ip.ip;

select *
from db_ip.ip;

update db_ip.ip
set min = trim(min),
    max = trim(max),
    loc = trim(loc);-- 把空格替换成min max loc

select inet_aton('166.111.3.207'); -- inet internet ston :address to number
select inet_ntoa('2792293327');
select *
from db_ip.ip
where inet_aton('166.111.3.207') between  inet_aton(min) and inet_aton(max);