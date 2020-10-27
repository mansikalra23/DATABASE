create database bank;

use bank;

create table branch
(ecode varchar(15) primary key,
branch_name varchar(50),
branch_city varchar(50),
street varchar(50)
);
INSERT INTO branch VALUES ('123456789', 'kankhal 2', 'haridwar', 'kankhal');
INSERT INTO branch VALUES ('234567890', 'noida 1', 'noida', 'noida mode');
INSERT INTO branch VALUES ('345678901', 'delhi 4', 'delhi', 'shardra');
INSERT INTO branch VALUES ('456789012', 'mumbai 10', 'mumbai', 'juhu');
INSERT INTO branch VALUES ('567890123','mumbai 5', 'mumbai', 'taj district');
INSERT INTO branch VALUES ('678901234','jagjeetpur', 'haridwar', 'kankhal');



