set serveroutput on;
set verify off;
accept x int prompt "Options : 1.Register for vaccine 2.Edit Phone Number 3.See personal information 4.See center list   5.Admin access:"

CREATE OR REPLACE FUNCTION findAccount(A in Users.NID_no%TYPE)
RETURN int
IS
id_Found int:=0;

BEGIN

	for r in(select * from Users where NID_no=A ) loop
		id_Found:=1;
	end loop;
	return id_Found;
END findAccount;
/
CREATE OR REPLACE PACKAGE userPackage AS
 	Procedure Registration(usi in Users.si%type,uRegistration_no in Users.Registration_no%type,uRegistration_date in Users.Registration_date%type,uName in Users.Name%type,uDoB in Users.DoB%type,uNID_no in Users.NID_no%type,uContact_no in Users.Contact_no%type,uDistrict in Users.District%type,uWard_no in Users.Ward_no%type,uPreferred_Center_ID in Users.Preferred_Center_ID%type);
	Procedure personalInformation(A in Users.NID_no%TYPE);
	Procedure centerList;

END userPackage;
/	

CREATE OR REPLACE PACKAGE BODY userPackage as 
Procedure EditPhoneNumber(uNID_no in Users.NID_no%type,uContact_no in Users.Contact_no%type)
is 
begin 
update  Users set Contact_No=uContact_no where NID_No=uNID_no;
end EditPhoneNumber;
PROCEDURE centerList is 
begin 
for r in(select * from Centers) loop
		dbms_output.put_line('Center ID : ' || r.Center_ID || ' Center Name : ' || r.Center_Name || ' District Name :' || r.District_Name);
	end loop;
end centerList;
Procedure Registration(usi in Users.si%type,uRegistration_no in Users.Registration_no%type,uRegistration_date in Users.Registration_date%type,uName in Users.Name%type,uDoB in Users.DoB%type,uNID_no in Users.NID_no%type,uContact_no in Users.Contact_no%type,uDistrict in Users.District%type,uWard_no in Users.Ward_no%type,uPreferred_Center_ID in Users.Preferred_Center_ID%type)
	IS
	/* usi int:=usi;
	uRegistration_no number:=uRegistration_no;
	uRegistration_date date :=uRegistration_date;
	uName VARCHAR2(50):=uName;
	uDoB date:=uDoB;
	uNID_no number:=uNID_no;
	uContact_no number:=uContact_no;
	uDistrict VARCHAR2(50):=uDistrict;
	uWard_no int:=uWard_no;
	uPreferred_Center_ID int:=uPreferred_Center_ID;*/
    BEGIN
	insert into Users(si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID)  values(usi,uRegistration_no,uRegistration_date,uName,uDoB,uNID_no,uContact_no,uDistrict,uWard_no,uPreferred_Center_ID);
	dbms_output.put_line('Insert SUCCESSFUL');
	
	END Registration;
Procedure personalInformation(A in Users.NID_no%TYPE)
is 
    usi int;
	uRegistration_no number;
	uRegistration_date date;
	uName VARCHAR2(50);
	uDoB date;
	uNID_no number;
	uContact_no number;
	uDistrict VARCHAR2(50);
	uWard_no int;
	uPreferred_Center_ID int;
begin 
	select si,Registration_no,Registration_date,Name,DoB,NID_no,Contact_no,District,Ward_no,Preferred_Center_ID into 
	usi,uRegistration_no,uRegistration_date,uName,uDoB,uNID_no,uContact_no,uDistrict,uWard_no,uPreferred_Center_ID from Users where NID_no=A;
	dbms_output.put_line('SI no : ' || usi);
	dbms_output.put_line('Registration no : ' || uRegistration_no);
	dbms_output.put_line('Registration date: ' || uRegistration_date);
	dbms_output.put_line('Name : ' || uName);
	dbms_output.put_line('DoB : ' || uDoB);
	dbms_output.put_line('NID_no : ' || uNID_no);
	dbms_output.put_line('Contact_no : ' || uContact_no);
	dbms_output.put_line('District : ' || uDistrict);
	dbms_output.put_line('Ward_no : ' || uWard_no);
	dbms_output.put_line('Preferred_Center_ID : ' || uPreferred_Center_ID);
end personalInformation;
	 
	END userPackage;
/	

declare 
    a int :=&x;
	usi int;
	uRegistration_no number;
	uRegistration_date date;
	uName VARCHAR2(50);
	uDoB date;
	uNID_no number;
	uContact_no number;
	uDistrict VARCHAR2(50);
	uWard_no int;
	uPreferred_Center_ID int;	
begin 
  userPackage.centerList;
if a=1 then 
  -- userPackage.Registration();
  
	uNID_no:=&NID_No;
	usi:=findAccount(uNID_no);
	a:=0;
	if(usi=1) then 
	--userPackage.personalInformation(uNID_no);
	dbms_output.put_line('Already registered with this NID');
	else 
	select count(*) into usi from Users;
	select Registration_no into uRegistration_no from Users where si=usi;
	usi:=usi+1;
	uRegistration_no:=uRegistration_no+1;
	uRegistration_date:=sysdate;
	uName:='&Name';
	uDoB:=to_date('&dob','yyyy-mm-dd');
	uContact_no:=&Contact_No;
	uDistrict:='&District';
	uWard_no:=&Ward_No;
	uPreferred_Center_ID:=&Preferred_Center_ID;
	userPackage.Registration(usi,uRegistration_no,uRegistration_date,uName,uDoB,uNID_no,uContact_no,uDistrict,uWard_no,uPreferred_Center_ID);
   end if;
 
 end if;
end;
/