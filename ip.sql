drop database  if exists db_ip;
create  database  db_ip;

drop table  if exists db_ip.ip;
create table db_ip.ip(
  id int auto_increment primary key comment  'id pk',
 min varchar(15) not null comment 'min id NN',
 max varchar(15) not null comment 'min id NN',
  loc varchar(15) not null comment 'min id NN'

);
select *
from db_ip.ip;
load data local infile 'd:/ip.txt'
into table dp_ip.ip
fields terminated by '|'
  (min,max,loc)
set id =null;
