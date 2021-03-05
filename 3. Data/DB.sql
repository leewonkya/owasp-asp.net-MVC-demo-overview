use master;

drop database TOP10OWASP;

create database TOP10OWASP;

use TOP10OWASP;

CREATE TABLE USERACCOUNT(
	ID INT IDENTITY PRIMARY KEY,
	USERNAME NVARCHAR(50),
	PASSWORD NVARCHAR(50),
	NAME NVARCHAR(50),
	ROLE VARCHAR(MAX),
);

CREATE TABLE USERACCOUNTOWASP(
	ID INT IDENTITY PRIMARY KEY,
	USERNAME NVARCHAR(50),
	PASSWORD VARBINARY(16),
	NAME NVARCHAR(50),
	ROLE VARCHAR(MAX),
);

CREATE TABLE MESSAGE(
	ID INT IDENTITY PRIMARY KEY,
	MESSAGE NVARCHAR(100)
);


CREATE TABLE CATEGORY(
	ID INT IDENTITY PRIMARY KEY,
	NAME NVARCHAR(50),
);

CREATE TABLE PRODUCT(
	ID INT IDENTITY PRIMARY KEY,
	NAME NVARCHAR(50),
	PRICE FLOAT,
	CATEGORY_ID INT FOREIGN KEY REFERENCES CATEGORY(ID)
);


INSERT INTO USERACCOUNT(USERNAME, PASSWORD, NAME, ROLE) VALUES('admin', 'admin', 'admin', 'admin');
INSERT INTO USERACCOUNT(USERNAME, PASSWORD, NAME, ROLE) VALUES('user1', 'user1', 'user1', 'user');
INSERT INTO USERACCOUNT(USERNAME, PASSWORD, NAME, ROLE) VALUES('user2', 'user2', 'user2', 'user');

INSERT INTO USERACCOUNTOWASP(USERNAME, PASSWORD, NAME, ROLE) VALUES('admin', HASHBYTES('MD5', 'admin'), 'admin', 'admin');
INSERT INTO USERACCOUNTOWASP(USERNAME, PASSWORD, NAME, ROLE) VALUES('user1', HASHBYTES('MD5', 'user1'), 'user1', 'user');
INSERT INTO USERACCOUNTOWASP(USERNAME, PASSWORD, NAME, ROLE) VALUES('user2', HASHBYTES('MD5', 'user2'), 'user2', 'user');

update USERACCOUNTOWASP set PASSWORD =  HASHBYTES('md5', 'admin') where id = 1

select * from USERACCOUNT

select convert(varchar(32), HASHBYTES('md5', 'admin'), 2)


INSERT INTO CATEGORY(NAME)  VALUES('COFFEE');
INSERT INTO CATEGORY(NAME)  VALUES('TEA');
INSERT INTO CATEGORY(NAME)  VALUES('CHOCOLATE');

INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('COFFEE1', 100, 1);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('COFFEE2', 101, 1);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('COFFEE3', 102, 1);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('COFFEE4', 103, 1);

INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('TEA1', 200, 2);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('TEA2', 201, 2);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('TEA3', 202, 2);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('TEA4', 203, 2);

INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('CHOCOLATE1', 300, 3);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('CHOCOLATE2', 301, 3);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('CHOCOLATE3', 302, 3);
INSERT INTO PRODUCT(NAME, PRICE, CATEGORY_ID) VALUES('CHOCOLATE4', 303, 3);


select * from USERACCOUNT
select password from  USERACCOUNTOWASP where id = 1

select * from USERACCOUNT where PASSWORD = 'Dev' or 'a'='a'


DECLARE @Ciphertext varbinary(32)

DECLARE @Plaintext varchar
DECLARE @LEN int
SET @Plaintext = 'admin'
set @Ciphertext = HashBytes('MD5', @Plaintext)
SET @LEN = LEN(@Ciphertext)
print @Ciphertext
print '--'
print @LEN