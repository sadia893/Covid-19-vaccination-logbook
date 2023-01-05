set serveroutput on;
set verify off;

CREATE OR REPLACE PACKAGE adminPackage AS
 	Procedure CenterList;
	Procedure UsersT;
	Procedure fd;
	Procedure sd;
	Procedure td;
	--PROCEDURE addCenter;
    PROCEDURE updateDoseTables;
END adminPackage;
/	

CREATE OR REPLACE PACKAGE BODY adminPackage as 
PROCEDURE updateDoseTables is 
	dsi int;
	dRegistration_no number;
	dScheduled_date date;
	dReceived_date date;
	dVaccineName VARCHAR2(50);
	dBatch_no int;
	dCenter_ID int;
BEGIN
for r in(select * from First_dose) loop
		if r.Received_date!=NULL then
		dRegistration_no :=r.Registration_no;
		for r in(select Registration_no from Second_dose where Registration_no=dRegistration_no) loop
		dsi:=1;
		 end loop;
		if dsi=0 then
		select count(*) into dsi from Second_dose;
		dsi:=dsi+1;
		insert into Second_dose(si,Registration_no,Center_ID) values(dsi,r.Registration_no,r.Center_ID);
		end if;
		end if;
		end loop;
end updateDoseTables;
PROCEDURE centerList is 
begin 
dbms_output.put_line('DHAKA');
for r in(select * from Centers@server) loop
		dbms_output.put_line('Center ID : ' || r.Center_ID || ' Center Name : ' || r.Center_Name || ' District Name :' || r.District_Name);
	end loop;

dbms_output.put_line('CHITTAGONG');
for r in(select * from Centers) loop
		dbms_output.put_line('Center ID : ' || r.Center_ID || ' Center Name : ' || r.Center_Name || ' District Name :' || r.District_Name);
	end loop;
end centerList;
PROCEDURE UsersT is 
begin 

dbms_output.put_line('DHAKA');
dbms_output.put_line('si-Registration_no-Registration_date-Name-DoB-NID_no-Contact_no-District-Ward_no-Center_ID');
for r in(select * from Users@server) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Registration_date|| ' '|| r.Name|| ' '|| r.DoB|| ' '|| r.NID_no|| ' '|| r.Contact_no|| ' '|| r.District|| ' '|| r.Ward_no|| ' '|| r.Preferred_Center_ID);
	end loop;
	
dbms_output.put_line('CHITTAGONG');
for r in(select * from Users ) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Registration_date|| ' '|| r.Name|| ' '|| r.DoB|| ' '|| r.NID_no|| ' '|| r.Contact_no|| ' '|| r.District|| ' '|| r.Ward_no|| ' '|| r.Preferred_Center_ID);
	end loop;
end UsersT;
PROCEDURE fd is 
begin 

dbms_output.put_line('DHAKA');
dbms_output.put_line('si-Registration_no-Scheduled_date-Received_date-VaccineName-Batch_no-Center_ID');
for r in(select * from First_dose@server) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Scheduled_date|| ' '|| r.Received_date|| ' '|| r.VaccineName|| ' '|| r.Batch_no|| ' '|| r.Center_ID);
	end loop;
	dbms_output.put_line('CHITTAGONG');
	for r in(select * from First_dose) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Scheduled_date|| ' '|| r.Received_date|| ' '|| r.VaccineName|| ' '|| r.Batch_no|| ' '|| r.Center_ID);
	end loop;
end fd;
PROCEDURE sd is 
begin 
dbms_output.put_line('DHAKA');
dbms_output.put_line('si-Registration_no-Scheduled_date-Received_date-VaccineName-Batch_no-Center_ID');
for r in(select * from Second_dose@server) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Scheduled_date|| ' '|| r.Received_date|| ' '|| r.VaccineName|| ' '|| r.Batch_no|| ' '|| r.Center_ID);
	end loop;
	dbms_output.put_line('CHITTAGONG');
for r in(select * from Second_dose) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Scheduled_date|| ' '|| r.Received_date|| ' '|| r.VaccineName|| ' '|| r.Batch_no|| ' '|| r.Center_ID);
	end loop;
end sd;
PROCEDURE td is 
begin 
dbms_output.put_line('DHAKA');
dbms_output.put_line('si-Registration_no-Scheduled_date-Received_date-VaccineName-Batch_no-Center_ID');
for r in(select * from Third_dose@server) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Scheduled_date|| ' '|| r.Received_date|| ' '|| r.VaccineName|| ' '|| r.Batch_no|| ' '|| r.Center_ID);
	end loop;
	dbms_output.put_line('CHITTAGONG');
dbms_output.put_line('si-Registration_no-Scheduled_date-Received_date-VaccineName-Batch_no-Center_ID');
for r in(select * from Third_dose) loop
		dbms_output.put_line(r.si || ' '|| r.Registration_no|| ' '|| r.Scheduled_date|| ' '|| r.Received_date|| ' '|| r.VaccineName|| ' '|| r.Batch_no|| ' '|| r.Center_ID);
	end loop;
end td;
end adminPackage;
/

	
begin 
dbms_output.put_line('1.Show Center List');
dbms_output.put_line('2.Show User');
dbms_output.put_line('3.Show first dose table');
dbms_output.put_line('4.Show Second dose table');
dbms_output.put_line('5.Show third dose table');
dbms_output.put_line('5.Show third dose table');
dbms_output.put_line('6.Update Dose Tables');


end;
/	
declare 
    b int :=&x;
begin 
if b=1 then 
adminPackage.centerList;
elsif b=2 then 
adminPackage.UsersT;
elsif b=3 then 
adminPackage.fd;
elsif b=4 then 
adminPackage.sd;
elsif b=5 then 
adminPackage.td;
elsif b=6 then 
adminPackage.updateDoseTables;
end if;

end;
/
