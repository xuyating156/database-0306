# mysql

## 1.简介

####　１.１常用命令

* 修改用户密码：mysqladmin -u 用户名 -p旧密码password 新密码
*  显示所有数据库：show databases
* 使用数据库：use<数据库名>
* select命令：显示当前链接或选择的信息
  * select database();  显示当前链接数据库
  * select version();显示当前服务器版本
  * select now();  显示当前日期时间
  * select user();  显示当前用户

```sql
--修改用户密码的命令
mysqladmin -uroot -proot123 password mysql123

--登录mysql数据库的命令
mysql -uroot -proot123

--显示数据库的命令
show databases;

--使用数据库的命令
use mysql;

--显示当前连接的数据库
select database();

--显示当前服务器的版本
select version();

--显示当前日期时间
select now();

--显示当前用户
show user();
```



#### １.２操作数据库

* 创建数据库语法格式
  * CREATE DATABASE[IF NOT EXISTS] db_name
  * [DEFAULT]CHARACTER SET [=] charset_name:指定字符集
* 修改数据库
  * ALTER DATABASE db_name
  * [DEFAULT]CHARACTER SET [=] charset_name:指定字符集
* 删除数据库
  * DROP DATABASE[IF NOT EXISTS] db_name

```sql
--创建数据库
create database test1;

create database if not exists test2 character set utf8;

--修改数据库的编码格式
alter database test2 character set latin1;

--查看数据库的编码格式
show variables like 'character%';

--删除数据库
drop database test2;
```



##　2.数据类型

#### 2.1 整形和浮点型

![1](E:\2019\test_code\MYSQL\照片\1.png)

![2](E:\2019\test_code\MYSQL\照片\2.png)

![3](E:\2019\test_code\MYSQL\照片\3.png)

![字符型](E:\2019\test_code\MYSQL\照片\字符型.png)



## 3.数据库表结构类型

#### 3.1 创建和查看数据库表

```sql
--创建图书管理系统的数据库
create database book;

--使用数据库
use book;

--创建读者信息表
create table reader(
	card_id char(18),
	name varchar(10),
	sex enum('男','女'),
	age tinyint,
	tel char(11),
	balance decimal(7,3)
);

--查看数据库表列表
show tables from book;

--查看数据表的基本结构
show columns from reader;

desc reader;

--查看表的详细结构（可以用来显示数据表的创建语句）
show create table reader;

```

#### 3.2修改数据库表

```sql
--修改表添加列
alter table reader add email varchar(30);

--查看表的基本结构
desc reader;

--修改表，在指定位置添加列
alter table reader add email2 varchar(30) after tel;

--修改列名
alter table reader change email2 email_bak varchar(30);

--修改列的数据类型
alter table reader modify email varchar(25);

--修改列的排列位置
alter table reader modify balance decimal(7,3) after email;

--删除列
alter table reader drop email_bak;

--修改表名
alter table reader rename to readerinfo;


```



#### 3.3删除数据库表

```sql
--删除多个数据库表
drop table t1,t2;

--创建分区表
create table bookinfo(
	book_id int,
	book_name varchar(20)
)
partition by range(book_id)(
	partition p1 values less than(20109999),
	partition p2 values less than(20159999),
	partition p3 values less than MAXVALUE
);

--插入3条测试数据
insert into bookinfo values(20100005,'t1');
insert into bookinfo values(20140015,'t2');
insert into bookinfo values(20170011,'t3');

--指定分区查看数据
select * from bookinfo partition(p1);
```





##　4.约束

* 确保表的完整性和唯一性

| 约束类型 | 非空约束 | 主键约束                   | 唯一约束             | 默认约束     | 外键约束           |
| -------- | -------- | -------------------------- | -------------------- | ------------ | ------------------ |
| 关键字   | not null | primary key                | unique               | default      | foreing key        |
| 作用     | 不能为空 | 通过主键准确定位到一行数据 | 指定一列的值不能重复 | 自动赋予默认 | 两个表之间建立链接 |

#### 4.2非空约束

```sql
--创建表时添加非空约束
create table bookinfo(
	book_id int,
	book_name varchar(20) not null
);

--删除非空约束
alter table bookinfo modify book_name varchar(20);

--通过修改表添加非空约束
alter table bookinfo modify book_name varchar(20) not null;
```



#### 4.3主键约束

```sql
--创建表时添加主键约束
create table bookinfo(
	book_id int primary key,
	book_name varchar(20) not null
);

create table bookinfo(
	book_id int,
	book_name varchar(20) not null,
	constraint pk_id primary key(book_id)
);

--删除主键约束
ALTER TABLE bookinfo DROP PRIMARY KEY;


--通过修改表的方式添加主键约束
ALTER TABLE bookinfo ADD PRIMARY KEY(book_id);

```



#### 4.4唯一约束

```sql
--创建表时添加唯一约束
CREATE TABLE bookinfo(
	book_id INT PRIMARY KEY,
	book_name VARCHAR(20) NOT NULL UNIQUE 
);

--删除唯一约束
ALTER TABLE book_info DROP  KEY  uk_bname;


--通过修改表的方式添加唯一约束
ALTER TABLE bookinfo ADD UNIQUE(book_name);

```



#### 4.5默认约束

```sql
--创建表时添加默认约束
CREATE TABLE bookinfo(
	book_id INT PRIMARY KEY,
	press VARCHAR(20)  DEFAULT '机械工业出版社'
);


--删除默认约束
ALTER TABLE bookinfo ALTER COLUMN press DROP DEFAULT;


--通过修改表的方式添加默认约束
ALTER TABLE bookinfo ALTER COLUMN press SET DEFAULT '机械工业出版社’;


```



#### 4.6外键约束

```sql
--创建表时添加外键约束

--图书类别表(父表)
CREATE TABLE bookcategory(
	category_id INT PRIMARY KEY,
	category VARCHAR(20),
	parent_id INT
);

--图书信息表(子表)
CREATE TABLE bookinfo(
	book_id INT PRIMARY KEY,
	book_category_id  INT,
	CONSTRAINT fk_cid FOREIGN KEY(book_category_id) REFERENCES bookcategory(category_id)
);


--删除外键约束
ALTER TABLE bookinfo DROP FOREIGN KEY fk_cid;


--通过修改表的方式添加外键约束
ALTER  TABLE  bookinfo  ADD  FOREIGN KEY(book_category_id) REFERENCES  bookcategory(category_id);

```



## 5.图像管理工具

## 6.表记录操作

#### 6.1单表数据记录的插入

```sql
-- 为表的所有列插入数据
insert into bookcategory(category_id,category,parent_id)values(1,'计算机',0);

insert into bookcategory values(2,'医学',0);

-- 为表的指定列插入数据
insert into readerinfo(card_id,name,tel)values('210210199901011111','张飞','13566661111');


-- 同时插入多条记录
insert into bookcategory(category_id,category,parent_id)values(3,'编程语言',1),(4,'数据库',1),(5,'儿科学',2);

-- 将查询结果插入的表中
insert into bookcategory select * from test where id>5;
```

#### 6.2自动编号设置

```sql
-- 创建表时添加自增列
create table bookcategory_tmp(
	category_id int primary key auto_increment,
	category varchar(20) not null unique,
	parent_id int not null
)auto_increment=5;

-- 测试自增列
insert into bookcategory_tmp(category,parent_id)values('医学',0);

-- 去掉自增列
alter table bookcategory_tmp modify category_id int;

-- 添加自增列
alter table bookcategory_tmp modify category_id int auto_increment;

-- 修改自增列的起始值
alter table bookcategory_tmp auto_increment = 15;

insert into bookcategory_tmp(category,parent_id)values('文学',0);


-- 删除图书信息表的外键
alter table bookinfo drop foreign key fk_bcid;

-- 为图书类别表添加自动编号的功能
alter table bookcategory modify category_id int auto_increment;

-- 恢复关联
alter table bookinfo add constraint fk_bcid foreign key(book_category_id)references bookcategory(category_id);

```



#### 6.3 单表数据记录更新

```sql
/*图书类别表*/
insert into bookcategory(category,parent_id)values('计算机',0),('医学',0),('编程语言',1),('数据库',1),('儿科学',2);

/*图书信息表*/
insert into bookinfo(book_id,book_category_id,book_name,author,price,press,pubdate,store)
values
(20150201,3, 'Java编程思想', '(美)埃克尔', 79.8, default, '2007-04-01', 5),
(20150202,4, 'PHP和MySQL Web开发', 'Luke Welling等',95, default, '2009-04-01', 2),
(20150301,3, 'Spring源码深度解析', '郝佳',69, '人民邮电出版社', '2013-09-01', 3),
(20160801,5, '中医儿科学', '汪受传', 136, '人民卫生出版社', '2011-04-01', 1),
(20170401,5, '小儿推拿秘笈', '李德修', 24.5, '人民卫生出版社', '2011-04-01',4);

/*读者信息表*/
insert into readerinfo(card_id,name,sex,age,tel,balance)
values
(210210199901011111,'张飞','女',18,'13566661111',300),
(210210199901012222,'李月','女',19,'13566662222',200),
(210210199901013333,'王鹏','男',20,'13566663333',300),
(210210199901014444,'刘鑫','男',21,'13566664444',400),
(210210199901015555,'杨磊','男',22,'13566665555',500);

/*
身份证号为210210199901011111的读者，2017-11-29借走了图书编号为20150201的这本书，
根据业务需求向借阅信息表插入一条借阅信息，更新读者信息表中的余额和图书信息表的库存，要求如下：
1、借书的期限为1个月。
2、借书的费用为：书的价格*5%
3、图书信息表中图书编号为20150201这本书的库存-1
*/

-- 向借阅信息表插入一条借阅信息
insert into borrowinfo(book_id,card_id,borrow_date,return_date,status)values(20150201,210210199901011111,'2017-11-29','2017-12-29','否');

-- 更新读者信息表中的余额
-- 查看书的价格   79.80
select price from bookinfo where book_id = 20150201;

-- 更新余额
update readerinfo set balance = balance - 79.80*0.05 where card_id = '210210199901011111';
select * from readerinfo;

-- 更新图书信息表的库存
update bookinfo set store = store -1 where book_id = 20150201;
select * from bookinfo;

```

#### 6.4单表数据记录删除

```sql
-- 删除指定条件的记录
delete from readerinfo where card_id = '210210199901011111';
-- 删除表中所有记录
delete from readerinfo;

/*读者信息表*/
insert into readerinfo(card_id,name,sex,age,tel,balance)
values
(210210199901011111,'张飞','女',18,'13566661111',300),
(210210199901012222,'李月','女',19,'13566662222',200),
(210210199901013333,'王鹏','男',20,'13566663333',300),
(210210199901014444,'刘鑫','男',21,'13566664444',400),
(210210199901015555,'杨磊','男',22,'13566665555',500);

truncate table readerinfo;

/*
图书管理系统要下架所有关于儿科学的书，实现的需求如下：
1、删除图书信息表中的所有关于儿科学的书。
2、删除图书类别表中儿科学这一类别
*/

-- 查询儿科学的类别编号   5
select category_id from bookcategory where category='儿科学';

-- 删除图书编号为5的图书信息
delete from bookinfo where book_category_id = 5;

-- 删除图书类别表中儿科学这个类别
delete from bookcategory where category = '儿科学';
```



#### 6.5单表数据记录查询

```sql
-- 查询所有列
select * from bookcategory;

select category_id,category,parent_id from bookcategory;

-- 查询指定列
select category from bookcategory;

select category_id,category from bookcategory;

-- 查询指定条件的记录
select book_id,book_name,price from bookinfo where press='机械工业出版社';

-- 查询结果不重复的记录
select distinct press from bookinfo;

-- 查看空值
select * from readerinfo where age is null;
```

#### 6.6对查询结果进行分组

```sql
-- 统计读者信息表中男读者的人数
select count(*) from readerinfo where sex='男';

-- 将读者信息表中的记录按性别进行分组
select sex from readerinfo group by sex;

-- 将读者信息表中的记录按性别进行分组，并统计每种性别的人数
select sex,count(*) from readerinfo group by sex;

-- 将读者信息表中的记录按性别进行分组，分组后人数大于的性别
select sex from readerinfo group by sex having count(sex)>2;
```

#### 6.7对查询结果进行排序

```sql
-- 单列排序
select * from bookinfo order by price;

-- 多列排序
select * from bookinfo order by price,store;

-- 指定排序方向
select * from bookinfo order by price,store desc;
```

#### 6.8通过LIMIT语句限制查询记录的数量

```sql
-- 前3行记录
select * from bookinfo limit 3;

-- 从第3条记录开始的后2条记录
select * from bookinfo limit 2,2;

select * from bookinfo limit 2 offset 2;

insert into bookinfo(book_id,book_category_id,book_name,author,price,press,pubdate,store)
values
(20160011,4, '高性能MySQL', 'Baron Schwartz等',85.8, '电子工业出版社', '2013-04-01', 10),
(20160210,4, '数据库系统基础教程', '[美]厄尔曼等', 35.5, '机械工业出版社', '2009-08-01', 20),
(20170050,4, '数据库系统实现', '[美]加西亚·莫利纳 ', 46.6, '机械工业出版社', '2010-05-01',8);

-- 将图书信息按照库存进行分组，统计每组库存下的个数，然后按库存进行降序排序，并查看结果中的前四条记录。

select store,count(*)from bookinfo group by store order by store desc limit 4;
```

##　7.运算符＆函数

#### 7.1运算符

```sql
select * from bookinfo;

select store, store+1,store-1,store/2, store*2, store%2 from bookinfo;

select * from readerinfo;

-- 读者的身份证号，姓名，电话，余额
select card_id, name, tel, balance from readerinfo where balance-200<=0;


-- 1、查看读者信息表中，余额大于200的读者信息。
select * from readerinfo where balance>200;


-- 2、查看读者信息表中，余额不等于200的读者信息。
select * from readerinfo where balance <> 200;


-- 3、查看读者信息表中，年龄不为空的读者信息。
select * from readerinfo where age is not null;


-- 4、查看读者信息表中，余额在350到450之间的读者信息。
select * from readerinfo where balance between 350 and 450;


-- 5、查看读者信息表，获取”张飞 ” , ”李月”, “王鹏”这几个读者的信息。
select * from readerinfo where name in('张飞','李月','王鹏');


-- 6、查看读者信息表，名字是两个字的，姓张的读者。
select * from readerinfo where name like '张_';


-- 7、查询手机号以”135”开头的读者信息。
select * from readerinfo where tel like '135%';


-- 1、查询图书信息表，查询书的价格大于50并且库存小于5的图书信息。
select * from bookinfo where price>50 and store<5;


-- 2、查询图书信息表，查询书的价格大于80或者出版社为’机械工业出版社’的。
select * from bookinfo where price>80 or press = '机械工业出版社';


-- 3、查询图书信息表，查询书的价格不在50到100之间的图书信息。
select * from bookinfo where price not between 50 and 100;
```



#### 7.2数值函数

```sql
-- 返回大于28.55的最小整数值。
select ceil(28.55);

-- 返回小于28.55的最大整数值
select floor(28.55);

-- 四舍五入
select round(28.55);
select round(28.55,1),round(28.55,0),round(28.55,-1);

-- 截断函数
select truncate(28.55,1),truncate(28.55,0),truncate(28.55,-1);

-- 取模
select mod(11,2);


-- 现需要对图书的价格进行粗略统计，要求查看图书信息表中的图书编号，书名，四舍五入书的价格到整数位。
select book_id,book_name,price, round(price) from bookinfo;


-- 查询图书编号为偶数的图书信息。
select * from bookinfo where mod(book_id,2)=0;

```



#### 7.3字符函数

```sql
-- 字符串连接
select concat('hello','world');
select concat_ws('-','hello','world');

select concat_ws('-',book_id,book_name,store) from bookinfo;

-- 字母转换大小写
select lower('Hello World');
select upper('Hello World');

select book_id,book_name,lower(book_name)from bookinfo;

-- 求长度
select length(' hello ');

-- 删除空格
select ltrim(' hello '),length(ltrim(' hello '));
select rtrim(' hello '),length(rtrim(' hello '));
select trim(' hello '),length(trim(' hello '));

-- 截取字符串
select substring('hello world',1,5);

select substring('hello world',-5,2);

-- 获取指定长度的字符串
select left('hello world', 5);
select right('hello world', 5);

-- 替换函数
select replace('hello world','world','mysql');

-- 格式化函数
select format(1234.5678,2),format(1234.5,2),format(1234.5678,0);
select book_id,book_name,format(price,2)from bookinfo;
```

#### 7.4日期时间函数

```sql
-- 查看当前的系统日期
select curdate()+0;

-- 查看当前的系统时间
select curtime()+0;

-- 查看当前的系统日期和时间
select now();

-- 查看当前的系统日期和时间
select sysdate();

-- 日期的加运算
select date_add('2017-01-01', interval 5 month);

-- 计算两个日期之间间隔的天数
select datediff('2017-02-10','2017-02-01');

-- 日期格式化
select date_format('2017-02-01', '%Y%m');
```



#### 7.5聚合函数

```sql
-- 1、求图书信息表中，所有图书的平均价格。
select avg(price) from bookinfo;

-- 2、求图书信息表中，所有图书的总价格。
select sum(price) from bookinfo;

-- 3、求图书信息表中的最大库存。
select max(store) from bookinfo;

-- 4、求图书信息表中的最小库存。
select min(store) from bookinfo;


-- 5、求图书信息表中有多少种图书。
select count(*) from bookinfo;


-- 6、按类别进行分组, 查询每种类别下有多少种图书以及每种类别图书的库存总和。
select book_category_id as '图书类别',count(book_id) as '图书种类', sum(store) as '库存总和' from bookinfo group by book_category_id;

```



#### 7.6信息函数&加密函数

```sql
-- 系统信息函数 
-- 查看当前MySQL服务器版本的版本号
select version();

-- 查看MySQL服务器当前连接的次数
select connection_id();

-- 查看当前的数据库名
select schema();

-- 查看当前登录的用户名
select user();

-- 加密函数
select md5('test');

create table myuser(
	username varchar(10),
	password varchar(35)
);

insert into myuser values('user1',md5('pwd1'));

select * from myuser;

select * from myuser where username = 'user1' and password = md5('pwd1');

select password('rootpwd');

set password = password('rootpwd');

select user,authentication_string from mysql.user;

```



## 8.子查询

## 9.多表连接查询

#### 9.1 多表连接查询

```sql
-- 多表连接
-- 通过查看图书信息表和图书类别表来获取图书编号、图书名称、图书类别
select book_id,book_name,category 
	from bookinfo 
	inner join bookcategory  
		on bookinfo.book_category_id = bookcategory.category_id;
```

#### 9.2内链接

```sql
-- 由于图书借阅统计的需要，想查询未归还图书的图书编号，图书名称，身份证号，姓名，电话，归还日期, 是否归还。
select borrowinfo.book_id,book_name,borrowinfo.card_id, name, tel, return_date, status 
	from borrowinfo
		inner join bookinfo 
			on borrowinfo.book_id = bookinfo.book_id
		inner join readerinfo 
			on borrowinfo.card_id = readerinfo.card_id
where borrowinfo.status = '否';


select t1.book_id,book_name,t1.card_id, name, tel, return_date, status 
	from borrowinfo t1
		join bookinfo t2 
			on t1.book_id = t2.book_id
		join readerinfo t3 
			on t1.card_id = t3.card_id
where t1.status = '否';
```

#### 9.3外连接

```sql
-- 根据业务需要，我们需要查看图书类别表中的所有类别下都有哪些图书。
select book_id, book_name, category 
	from bookcategory 
		left join bookinfo 
			on bookcategory.category_id = bookinfo.book_category_id
where parent_id<>0;


select book_id, book_name, category 
	from bookinfo a
		right join bookcategory b 
			on b.category_id = a.book_category_id;

select * from bookcategory;
```

#### 9.4自连接

```sql
select * from bookcategory;

-- 查询所有图书类别的图书类别编号，类别名称，上级分类名称。
select s.category_id as'图书类别编号', s.category as '图书类别名称', p.category as'图书的上级分类名称' 
	from bookcategory s
		inner join bookcategory p
			on s.parent_id = p.category_id;
```



#### 9.5多表更新

```sql
select * from borrowinfo;
select * from readerfee;

/*
今天身份证号为210210199901012222的读者将超限的图书20151101归还，根据描述实现如下需求：
1、更新借阅信息表，将借阅状态（status）更新为‘是’。
2、更新罚款记录信息表，更新实际还书日期和罚款金额，罚款金额为每超出一天扣0.2元。
3、同时更新读者信息表的余额。（在余额中扣除罚款金额）
*/

update readerfee t1 
	join readerinfo t2 
		on t1.card_id = t2.card_id
			set actual_return_date = sysdate(),book_fee=datediff(sysdate(),return_date)*0.2,balance = balance - book_fee
where t1.book_id = 20151101 and t1.card_id = '210210199901012222';

select * from readerinfo;
```



#### 9.6多表删除

```sql
create table bookcategory_bak
as
select * from bookcategory;

create table bookinfo_bak
as
select * from bookinfo;

select * from bookcategory_bak;
select * from bookinfo_bak;

-- 1、由于业务需求，需要删除图书类别表中在图书信息表中没有图书记录的类别。
select book_id,book_name,category from bookcategory_bak t1
left join bookinfo_bak t2 
on t1.category_id = t2.book_category_id
where parent_id<>0;

delete t1 from bookcategory_bak t1
left join bookinfo_bak t2 
on t1.category_id = t2.book_category_id
where parent_id<>0 and book_id is null;

select * from bookcategory_bak;

-- 2、需要删除图书类别表的编程语言的类别，以及图书信息表中关于编程语言的图书记录。

select book_id,book_name,category_id,category from bookcategory_bak t1
inner join bookinfo_bak t2
on t1.category_id = t2.book_category_id;


delete t1,t2 from bookcategory_bak t1
inner join bookinfo_bak t2
on t1.category_id = t2.book_category_id
where t1.category_id = 3; 


```