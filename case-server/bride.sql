SET NAMES UTF8;
DROP DATABASE IF EXISTS bride;
CREATE DATABASE bride CHARSET=UTF8;
USE bride;
-- 创建用户信息表
CREATE table bride_user(
   uid INT PRIMARY KEY AUTO_INCREMENT,
   uname varchar(16),
   upwd varchar(128),
   phone varchar(16),
   email varchar(32) 
<<<<<<< HEAD
);
=======
);
>>>>>>> f2e18bd0e85bb8378e937044ebf1bfca6b18ffe0
