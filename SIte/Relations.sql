clear screen;

drop table Users CASCADE CONSTRAINTS;
drop table First_dose CASCADE CONSTRAINTS;
drop table Second_dose CASCADE CONSTRAINTS;
drop table Third_dose CASCADE CONSTRAINTS;
drop table Centers CASCADE CONSTRAINTS;
 

create table Centers(
	Center_ID int,
	Center_Name VARCHAR2(50),
	District_Name VARCHAR2(50),
	PRIMARY KEY (Center_ID));

create table Users(
	si int,
	Registration_no number, 
	Registration_date date,
	Name VARCHAR2(50),
	DoB date,
	NID_no number,
	Contact_no number,
	District VARCHAR2(50),
	Ward_no int,
	Preferred_Center_ID int,
	PRIMARY KEY (Registration_no),
	unique (NID_no),
	FOREIGN KEY (Preferred_Center_ID) REFERENCES Centers (Center_ID));
	

create table First_dose(
	si int,
	Registration_no number, 
	Scheduled_date date,
	Received_date date,
	VaccineName VARCHAR2(50),
	Batch_no int,
	Center_ID int,
	PRIMARY KEY (Registration_no),
	FOREIGN KEY (Registration_no) REFERENCES Users (Registration_no),
	FOREIGN KEY (Center_ID) REFERENCES Centers (Center_ID));


create table Second_dose(
	si int,
	Registration_no number, 
	Scheduled_date date,
	Received_date date,
	VaccineName VARCHAR2(50),
	Batch_no int,
	Center_ID int,
	PRIMARY KEY (Registration_no),
	FOREIGN KEY (Registration_no) REFERENCES Users (Registration_no),
	FOREIGN KEY (Center_ID) REFERENCES Centers (Center_ID));
	


create table Third_dose(
	si int,
	Registration_no number, 
	Scheduled_date date,
	Received_date date,
	VaccineName VARCHAR2(50),
	Batch_no int,
	Center_ID int,
	PRIMARY KEY (Registration_no),
	FOREIGN KEY (Registration_no) REFERENCES Users (Registration_no),
	FOREIGN KEY (Center_ID) REFERENCES Centers (Center_ID)
	);



--CENTERS TABLE
insert into Centers(Center_ID,Center_Name,District_Name) values (2101,'Chittagong Medical College Hospital','Chittagong');
insert into Centers(Center_ID,Center_Name,District_Name) values (2102,'C.S.C.R Hospital','Chittagong');
insert into Centers(Center_ID,Center_Name,District_Name) values (2103,'CHEVRON','Chittagong');
insert into Centers(Center_ID,Center_Name,District_Name) values (2104,'Metropolitan Hospital Pvt. Ltd.','Chittagong');
insert into Centers(Center_ID,Center_Name,District_Name) values (2105,'Ekhushe Hospital','Chittagong');
--USERS
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(1,90789,(to_date('2021-12-23','yyyy-mm-dd')),'Ahsanul Haque',(to_date('1980-12-12','yyyy-mm-dd')),1238765478,01758585538,'Chittagong',1012,2101);
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(2,93654,(to_date('2021-12-25','yyyy-mm-dd')),'Hasanul Haque',(to_date('1990-11-12','yyyy-mm-dd')),2048785475,01655434838,'Chittagong',1013,2102);
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(3,70114,(to_date('2021-12-26','yyyy-mm-dd')),'Ayesha Tasnim',(to_date('1998-12-07','yyyy-mm-dd')),2158795577,01738783987,'Chittagong',1015,2104);
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(4,55739,(to_date('2022-01-11','yyyy-mm-dd')),'Sumaiya Islam',(to_date('1999-07-15','yyyy-mm-dd')),2208763478,01744578798,'Chittagong',1017,2103);
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(5,42954,(to_date('2022-01-27','yyyy-mm-dd')),'Nusrat Jahan',(to_date('2001-01-04','yyyy-mm-dd')),1998775379,01858778412,'Chittagong',1017,2105);
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(6,92954,(to_date('2021-12-26','yyyy-mm-dd')),'Israt Jahan',(to_date('1998-05-13','yyyy-mm-dd')),1781775379,01778798412,'Chittagong',1017,2105);
insert into  Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID) 
values(7,97954,(to_date('2022-02-27','yyyy-mm-dd')),'Meem Ahmed',(to_date('1997-03-04','yyyy-mm-dd')),1908575379,01978598412,'Chittagong',1017,2105);

--First_dose
insert into First_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (1,90789,(to_date('2022-01-23','yyyy-mm-dd')),(to_date('2022-01-23','yyyy-mm-dd')),'Moderna',101,2101);
insert into First_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (2,93654,(to_date('2022-01-13','yyyy-mm-dd')),(to_date('2022-01-13','yyyy-mm-dd')),'Pfizer',105,2105);
insert into First_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (3,70114,(to_date('2022-01-17','yyyy-mm-dd')),(to_date('2022-01-19','yyyy-mm-dd')),'Pfizer',103,2103);
insert into First_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (4,55739,(to_date('2022-02-19','yyyy-mm-dd')),(to_date('2022-02-23','yyyy-mm-dd')),'Pfizer',109,2103);
insert into First_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (5,42954,(to_date('2022-03-02','yyyy-mm-dd')),(to_date('2022-03-02','yyyy-mm-dd')),'Moderna',111,2102);
insert into First_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (6,92954,(to_date('2022-03-02','yyyy-mm-dd')),(to_date('2022-01-19','yyyy-mm-dd')),'Pfizer',103,2103);
insert into First_dose(si,Registration_no,Center_ID) 
values (7,97954,2103);


--Second_dose
insert into Second_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (1,90789,(to_date('2022-02-23','yyyy-mm-dd')),(to_date('2022-02-23','yyyy-mm-dd')),'Moderna',107,2101);
insert into Second_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (2,93654,(to_date('2022-02-13','yyyy-mm-dd')),(to_date('2022-02-13','yyyy-mm-dd')),'Pfizer',109,2105);
insert into Second_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (3,70114,(to_date('2022-02-17','yyyy-mm-dd')),(to_date('2022-02-19','yyyy-mm-dd')),'Pfizer',105,2103);
insert into Second_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (4,55739,(to_date('2022-03-19','yyyy-mm-dd')),(to_date('2022-03-23','yyyy-mm-dd')),'Pfizer',107,2103);
insert into Second_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (5,42954,(to_date('2022-02-17','yyyy-mm-dd')),(to_date('2022-02-21','yyyy-mm-dd')),'Moderna',117,2102);



--Third_dose
insert into Third_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (1,90789,(to_date('2022-03-23','yyyy-mm-dd')),(to_date('2022-03-23','yyyy-mm-dd')),'Moderna',107,2101);
insert into Third_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (2,93654,(to_date('2022-03-13','yyyy-mm-dd')),(to_date('2022-03-19','yyyy-mm-dd')),'Pfizer',109,2105);
insert into Third_dose(si,Registration_no,Scheduled_date,Received_date,VaccineName,Batch_no,Center_ID) 
values (3,70114,(to_date('2022-03-17','yyyy-mm-dd')),(to_date('2022-03-23','yyyy-mm-dd')),'Pfizer',105,2103);
commit;





