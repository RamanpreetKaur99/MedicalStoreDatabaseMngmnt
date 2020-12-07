CREATE DATABASE DRUG_MANAGEMENT_SYSTEM
USE DRUG_MANAGEMENT_SYSTEM

CREATE TABLE MEDICAL_STORE
(
   GST_no varchar(10) PRIMARY KEY,	
   Store_name varchar(20),
);

insert into MEDICAL_STORE values('ABC1234','BL Chemist');
insert into MEDICAL_STORE values('DEF1234','Ajay Medical Store');
insert into MEDICAL_STORE values('ABC4567','Nath Brothers');
insert into MEDICAL_STORE values('DEF7890','First care Pharmacy');
insert into MEDICAL_STORE values('XYZ7890','Vats Medicos');
insert into MEDICAL_STORE values('PQR4567','City Medicos');
insert into MEDICAL_STORE values('SDF3456','Anupam Medicos');
insert into MEDICAL_STORE values('CFG7867','Ashoka Medicines');
insert into MEDICAL_STORE values('RTY6754','Sanjivani Medicos')

CREATE TABLE STORE_ADD
(
   GST_no varchar(10) FOREIGN KEY REFERENCES MEDICAL_STORE(GST_no),
   House_no varchar(20),
   Street_no varchar(10),
   City varchar(20)
);
CREATE TABLE STOCK
(
   Item_id varchar(20) PRIMARY KEY,
   Item_type varchar(15),
   Item_name varchar(30),
   Mfg_date date,
   Exp_date date,
   Quantity int,
   Price float
);
delete from stock

insert into STOCK values('456ACF','Medicine','Paracetamol','2015-02-02','2018-03-12',200,5.50);
insert into STOCK values('786GHF','Soap','Johnsons','02/02/2016','2020-09-04',150,15);
insert into STOCK values('676UCF','Medicine','Disprin','2015-05-26','2019-02-14',170,3.50);
insert into STOCK values('986RCF','Bandage','BAND AID','2015-02-20','2020-10-18',400,2.00);
insert into STOCK values('QW6TYF','Medicine','Chrocine','2016-08-30','2019-09-04',180,6.00);
insert into STOCK values('576APO','Medicine','Benadryl','2015-02-18','2020-09-04',220,40);
insert into STOCK values('876YUF','Medicine','Hydrocodone','2015-02-02','2018-09-29',200,5.50);
insert into STOCK values('976APO','Medicine','Metformin','2015-03-08','2018-09-29',90,10.00);

CREATE TABLE BILL
(
  Bill_no int PRIMARY KEY,
  Bill_date date,
  GST_no varchar(10) FOREIGN KEY REFERENCES MEDICAL_STORE(GST_no),
  Login_id varchar(20) FOREIGN KEY REFERENCES PERSON(Login_id)
);

insert into BILL values(1245,'2018-06-04','ABC1234',170047);
insert into BILL values(365,'2017-06-04','ABC1234',170048);
insert into BILL values(8965,'2017-08-04','DEF1234',170051);
insert into BILL values(1275,'2018-12-04','PQR4567',170053);
insert into BILL values(1255,'2018-07-05','PQR4567',170053);
insert into BILL values(5265,'2018-06-07','CFG7867',170048);
insert into BILL values(2345,'2018-11-15','RTY6754',170047);
insert into BILL values(7855,'2018-06-14','ABC1234',170051);


CREATE TABLE PERSON
(
   Login_id varchar(20) PRIMARY KEY,
   P_Password varchar(10),
   P_name varchar(30),
   Contact_no varchar(10) 
);

insert into PERSON values('170047','MEDICAL','Alisa','7654322110');
insert into PERSON values('170048','MEDICAL1','John','1765862190');
insert into PERSON values('170049','MEDICAL12','Bob','2365692310');
insert into PERSON values('170050','MEDICAL23','Taylor','9256543210');
insert into PERSON values('170051','MEDICAL53','Jennifer','9132543210');
insert into PERSON values('170052','MEDICAL7','Kim','563643210');
insert into PERSON values('170053','MEDICAL8','Suzi','7625543210');
insert into PERSON values('170054','MEDICAL09','Monica','2654233210');
insert into PERSON values('170055','MEDICAL32','Alisa','4126543210');

CREATE TABLE CUSTOMERS
(
    Login_id varchar(20) FOREIGN KEY REFERENCES PERSON(Login_id)
);

insert into CUSTOMERS values('170047');
insert into CUSTOMERS values('170048');
insert into CUSTOMERS values('170050');
insert into CUSTOMERS values('170051');
insert into CUSTOMERS values('170053');
insert into CUSTOMERS values('170055');

CREATE TABLE DEALERS
(
   Login_id varchar(20) FOREIGN KEY REFERENCES PERSON(Login_id),
   Experience int
);

insert into DEALERS values('170049',5);
insert into DEALERS values('170052',7);
insert into DEALERS values('170054',3);

CREATE TABLE TRANSACTIONS
(
   Trans_id varchar(20) PRIMARY KEY,
   Trans_date date,
   Login_id varchar(20) FOREIGN KEY REFERENCES PERSON(Login_id),
   GST_no varchar(10) FOREIGN KEY REFERENCES MEDICAL_STORE(GST_no)
);

insert into TRANSACTIONS values('ABCDE','2017-02-03','170049','ABC1234');
insert into TRANSACTIONS values('DEFGH','2018-02-03','170052','ABC4567');
insert into TRANSACTIONS values('IJKLM','2017-10-03','170049','SDF3456');
insert into TRANSACTIONS values('NOPQR','2017-02-17','170052','DEF7890');
insert into TRANSACTIONS values('FGHIJ','2018-02-03','170052','ABC1234');
insert into TRANSACTIONS values('LMNOP','2017-07-03','170049','PQR4567');
insert into TRANSACTIONS values('BCDEF','2017-02-04','170054','RTY6754');

CREATE TABLE TRANSACTS
(
   Trans_id varchar(20) FOREIGN KEY REFERENCES TRANSACTIONS(Trans_id),
   Item_id varchar(20) FOREIGN KEY REFERENCES STOCK(Item_id),
   Trans_Quan int,
   PRIMARY KEY (Trans_id,Item_id) 
);

insert into TRANSACTS values('ABCDE','456ACF',450);
insert into TRANSACTS values('ABCDE','986RCF',500);
insert into TRANSACTS values('ABCDE','876YUF',520);
insert into TRANSACTS values('NOPQR','456ACF',700);
insert into TRANSACTS values('BCDEF','QW6TYF',650);
insert into TRANSACTS values('LMNOP','976APO',450);
insert into TRANSACTS values('NOPQR','786GHF',120);
insert into TRANSACTS values('IJKLM','456AF',50);
insert into TRANSACTS values('FGHIJ','986RCF',350);
insert into TRANSACTS values('DEFGH','876YUF',90);
insert into TRANSACTS values('BCDEF','576APO',100);

CREATE TABLE PURCHASES
(
   GST_no varchar(10) FOREIGN KEY REFERENCES MEDICAL_STORE(GST_no),
   Login_id varchar(20) FOREIGN KEY REFERENCES PERSON(Login_id),
   PRIMARY KEY (GST_no,Login_id)
);

insert into PURCHASES values('ABC1234','170048');
insert into PURCHASES values('DEF7890','170048');
insert into PURCHASES values('ABC1234','170047');
insert into PURCHASES values('ABC1234','170053');
insert into PURCHASES values('ABC4567','170051');
insert into PURCHASES values('DEF1234','170053');
insert into PURCHASES values('XYZ7890','170047');
insert into PURCHASES values('CFG7867','170051');
insert into PURCHASES values('CFG7867','170048');

CREATE TABLE STORE_HOLDS
(
  GST_no varchar(10) FOREIGN KEY REFERENCES MEDICAL_STORE(GST_no),
   Item_id varchar(20) FOREIGN KEY REFERENCES STOCK(Item_id),
   PRIMARY KEY (GST_no,Item_id)
);

insert into STORE_HOLDS values('ABC1234','456ACF');
insert into STORE_HOLDS values('ABC1234','676UCF');
insert into STORE_HOLDS values('CFG7867','986RCF');
insert into STORE_HOLDS values('ABC4567','786GCF');
insert into STORE_HOLDS values('DEF7890','456ACF');
insert into STORE_HOLDS values('ABC1234','QW6TYF');
insert into STORE_HOLDS values('DEF7890','576APO');
insert into STORE_HOLDS values('DEF1234','876YUF');
insert into STORE_HOLDS values('XYZ7890','976APO');
insert into STORE_HOLDS values('PQR4567','676UCF');
insert into STORE_HOLDS values('SDF3456','876YUF');
insert into STORE_HOLDS values('RTY6754','976APO');

CREATE  TABLE FROM_STOCK
(
  Item_id varchar(20) FOREIGN KEY REFERENCES STOCK(Item_id),
  Bill_no int FOREIGN KEY REFERENCES BILL(bill_no),
  Quan_purchased int,
  PRIMARY KEY(Item_id,Bill_no)
);

insert into FROM_STOCK values('456ACF',1245,10);
insert into FROM_STOCK values('456ACF',365,5);
insert into FROM_STOCK values('676UCF',8965,15);
insert into FROM_STOCK values('986RCF',1275,20);
insert into FROM_STOCK values('QW6TYF',1255,25);
insert into FROM_STOCK values('576APO',5265,10);
insert into FROM_STOCK values('876YUF',2345,12);
insert into FROM_STOCK values('976APO',7855,20);
insert into FROM_STOCK values('456ACF',7855,30);
insert into FROM_STOCK values('576APO',1245,25);
insert into FROM_STOCK values('QW6TYF',1245,35);


