-- triggers specipy an action to be taken when a specific operation is performed.

CREATE DATABASE libraryy;
use libraryy;


create table librarybooks
(
acc_no varchar(20) primary key,
title varchar(50),
author varchar(50),
department varchar(50),
purchase_date date,
price int
);
INSERT INTO librarybooks VALUES ('1234567', 'introduction to python', 'timothy', 'cs', '2000-01-23', '300');
INSERT INTO librarybooks VALUES ('2233555', 'fundamentals of statistics', 'john', 'statistics', '1999-12-09', '500');
INSERT INTO librarybooks VALUES ('3344222', 'applied mathematics', 'r kumar', 'maths', '1998-04-10', '200');
INSERT INTO librarybooks VALUES ('9876543', 'r programming', 'priya', 'cs', '2001-09-13', '250');
INSERT INTO librarybooks VALUES ('7654321', 'number theory', 'ishani', 'maths', '1997-03-25', '100');
INSERT INTO librarybooks VALUES ('5678912', 'maths', 'navate', 'maths', '2000-10-09', '500');
INSERT INTO librarybooks VALUES ('4455666', 'discreate maths', 'navate', 'maths', '2004-05-17', '600');

CREATE TABLE BooksArchives (
    acc_no varchar(20) primary key,
	title varchar(50),
	author varchar(50),
	department varchar(50),
    deletedAt TIMESTAMP DEFAULT NOW()
);

DELIMITER $$
CREATE TRIGGER before_book_delete
BEFORE DELETE
ON librarybooks FOR EACH ROW
BEGIN
    INSERT INTO BooksArchives(acc_no, title, author, department)
    VALUES(OLD.acc_no, OLD.title, OLD.author, OLD.department );
END$$
DELIMITER ;

-- testing delete trigger
DELETE FROM librarybooks 
WHERE acc_no = 3344222;

-- DROP TRIGGER
drop trigger before_book_delete;

-- DISPLAY TRIGGER
show triggers
in libraryy;
