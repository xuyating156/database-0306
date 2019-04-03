
show databases;
drop database if exists db_ec;
create database db_ec;

drop table if exists db_ec.user;
create table db_ec.user
(
  id       int auto_increment primary key comment 'idPK',
  emile    varchar(255) not null unique comment '邮箱',
  password varchar(255) not null comment 'password nn',
  mobile   varchar(255) not null comment 'telephone num'

) comment '用户表';

drop table if exists db_ec.user_info;
create table db_ec.user_info
(
  id     int auto_increment primary key comment 'idPK',
  avatar varchar(255) unique comment 'avatar',
  gender char(2) comment 'gender',
  city   varchar(255) comment 'city',
  userId int comment 'usern id fk'
) comment '用户表 括在信息表';


drop table if exists db_ec.category;
create table db_ec.category(
                            id  int auto_increment primary key comment 'idPK',
                            title varchar(255) not null comment 'title nn',
                            categoryID  int  comment 'parent category id pk ',
                            picture varchar( 255)comment '商品金额'

)comment '商品类别表';

drop table if exists db_ec.product;
create table db_ec.product(
                         id  int auto_increment primary key comment 'idPK',
                         title varchar(255) not null comment 'title nn',
                         price decimal(8,2) not null comment '商品金额',
                         originalPrice decimal(8,2) comment 'originalPrice',
                        -- silePictures text not null comment 'slide pictures',
                         -- slide pictures
                         -- detail pictures
                         categoryID int  comment 'categoryID fk',
                         userId int comment 'usern id fk'

)comment '商品表';

drop table if exists db_ec.pictures;
create table db_ec.pictures
(
  id         int auto_increment primary key comment 'idPK',
title varchar(255) not null unique comment 'title nn nu',
type int(1) not null comment 'type: 1-slide picture 2-detail picture',
productID int comment 'product id pk'
) comment 'pictures';

drop table if exists db_ec.order;
create table db_ec.order
(
  id         int auto_increment primary key comment 'idPK',
  userId int comment 'usern id fk',
    productID int comment 'product id pk'
) comment 'order';



alter table db_ec.user_info
  add constraint
    user_info_fk_userId
    foreign key (userId)
      references db_ec.user (id);

alter table db_ec.category
  add constraint
    category_fk_categoryID
    foreign key (categoryID)
      references db_ec.category(id);

alter table db_ec.product
  add constraint
    product_fk_categoryId
    foreign key (categoryId)
      references db_ec.category (id);

alter table db_ec.pictures
  add constraint
    pictures_fk_productId
    foreign key (productId)
      references db_ec.product (id);

alter table db_ec.product
  add constraint
    product_fk_userID
    foreign key (userID)
      references db_ec.user (id);




SET AUTOCOMMIT = 0;
SET AUTOCOMMIT = 1;

select *
from db_ec.user;

select *
from db_ec.user_info;

select *
from db_ec.category;

select *
from db_ec.product;

select *
from db_ec.pictures;

select *
from db_ec.user;

insert into db_ec.user value(null , '123456@qq.com','abc','1561868378');
insert into db_ec.user value(null , '123566@qq.com','def','1561859778');
insert into db_ec.user value(null , '123446@qq.com','123','1561855028');

insert into db_ec.user_info value(null,'1.jpg','男','北京',null);
insert into db_ec.user_info value(null,'2.jpg','女','天津',null);
insert into db_ec.user_info value(null,'3.jpg','男','上海',null);
insert into db_ec.user_info value(null,'4.jpg','男','浙江',null);






