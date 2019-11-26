## 需求

### 机构信息登记
机构全称、简称、统一社会信用代码
联系人、联系电话、通讯地址
机构logo上传

### 系统用户
用户注册
用户登录
登录前只能查看和搜索
登录后可以进行编辑

## 设计

### 软件
mybatis, spring, mybatis

### 数据表

数据库
CREATE DATABASE ums DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

机构表
create table org_info(
id int unsigned not null primary key auto_increment,
fullname varchar(255) not null default '',
briefname varchar(255) not null default '',
orgcode varchar(100) not null default '',
logolocation varchar(255) not null default ''
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



```

insert into org_info(fullname, briefname,orgcode) values('百度有限公司','百度','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('京东有限公司','京东','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('腾讯有限公司','腾讯','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('百度有限公司2','百度2','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('京东有限公司2','京东2','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('腾讯有限公司2','腾讯2','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('百度有限公司3','百度3','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('京东有限公司3','京东3','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('腾讯有限公司3','腾讯3','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('百度有限公司4','百度4','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('京东有限公司4','京东4','123456789123456789');
insert into org_info(fullname, briefname,orgcode) values('腾讯有限公司4','腾讯4','123456789123456789');
```

联系人表
create table org_contact(
id int unsigned not null primary key auto_increment,
oid int unsigned not null,
name varchar(255) not null default '',
email varchar(255) not null default '',
phone varchar(255) not null default '',
address varchar(255) not null default ''
)ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

```
insert into org_contact(oid, name, email ) values(1,'牛魔王','abc@abc.com');
insert into org_contact(oid, name, email ) values(2,'红孩儿','abc@abc.com');
insert into org_contact(oid, name, email ) values(3,'张天师','abc@abc.com');
insert into org_contact(oid, name, email ) values(4,'张无忌','abc@abc.com');
insert into org_contact(oid, name, email ) values(5,'柳叶刀','abc@abc.com');
insert into org_contact(oid, name, email ) values(6,'许仙','abc@abc.com');
insert into org_contact(oid, name, email ) values(7,'张三','abc@abc.com');
insert into org_contact(oid, name, email ) values(8,'李四','abc@abc.com');
insert into org_contact(oid, name, email ) values(9,'王五','abc@abc.com');
insert into org_contact(oid, name, email ) values(10,'赵六','abc@abc.com');
insert into org_contact(oid, name, email ) values(11,'聂风','abc@abc.com');
insert into org_contact(oid, name, email ) values(12,'步惊云','abc@abc.com');
```

系统用户表
create table sys_user(
id int unsigned not null primary key auto_increment,
name varchar(100) not null default '',
password varchar(100) not null default ''
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

### 文件存放路径
写在配置文件里
配置文件名称：config.properties
读取配置文件的方法：https://blog.csdn.net/YaoChung/article/details/86674756

### 权限限制
使用拦截器实现url的访问控制

## 部署

mysql=localhost:3306  root 123456

## 参考

layui前后端分页
https://www.jianshu.com/p/ac55efefe896