# Covid-19-vaccination-logbook
A distributed database project
A distributed database that contains covid-19 vaccination information .Authority can get
necessary data, for instance how many people have been vaccinated for covid-19 ,which vaccine
they get.Sites at different region hold data of that region and one site can access another site’s
data.
Database Schema:
Personal_informatation(SI,Registration_no,Registration_date,Name,DoB,NID_no,District,Ward
_no,Preferred_Center_ID)
First_dose(SI,Registration_no,Scheduled_date,Received_date,VaccineName,Manufacturer,Batch
no Center ID)
Second_dose(SI,Registration_no,Scheduled_date,Received_date,VaccineName,Manufacturer,Ba
tch no Center ID)
Third_dose(SI,Registration_no,Scheduled_date,Received_date,VaccineName,Manufacturer,Batc
h no Center ID)
Why it needs a distributed database -
● If a person want to take second dose of vaccine at a different location this distributed
database will help the authority to verify necessary information easily.
● It will make the data analysis on covid-19 vaccination easier.
