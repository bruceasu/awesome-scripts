
-- # 运行下面命令进行数据库的初始化：
-- #mysql_install_db \
-- #       --defaults-file=my.cnf\
-- #       --datadir=.

create database testdb;
create user test@'%' identified by 'test123';
create user test@'localhost' identified by 'test123';
grant all privileges on testdb.* to test@'%' identified by 'test123';
grant all privileges on testdb.* to test@'localhost' identified by 'test123';

flush privileges;
use testdb;
show tables;
/*
 CREATE TABLE test1 (
　　id int(11) NOT NULL AUTO_INCREMENT,
　　v varchar(255) DEFAULT NULL,
　　vb varbinary(255) DEFAULT NULL
　　) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE test2 (
　　id int(11) NOT NULL AUTO_INCREMENT,
　　v varchar(255) DEFAULT NULL,
　　vb varbinary(255) DEFAULT NULL,
　　PRIMARY KEY (id)
　　) ENGINE=InnoDB DEFAULT CHARSET=utf8;

show tables;
describe test1;
describe test2;

*/
