/**
** SQL DML
**/

# clear tables
delete from city;
delete from renting;
delete from signed_up;
delete from student;
delete from dorm;
delete from educational_institution;
delete from kitchen;
delete from room;
delete from room_rent;


# insert into tables
insert into city values(2800,'Lyngby');
insert into city values(2850,'Nærum');
insert into city values(4000,'Roskilde');
insert into city values(1165,'København');
insert into dorm values('Kampsax Kollegiet','Kollegiebakken', '9', 2800);
insert into dorm values('Paul Bergsø Kollegiet','Skodsborgvej', '190', 2850);
insert into dorm values('Ostenfeld Kollegiet','Rævehøjvej', '36', 2800);
# Kitchen ID, dorm name
insert into kitchen values(000008,'Kampsax Kollegiet');
insert into kitchen values(000013,'Kampsax Kollegiet');
insert into kitchen values(000020,'Kampsax Kollegiet');
insert into kitchen values(010001,'Ostenfeld Kollegiet');
insert into kitchen values(010002,'Ostenfeld Kollegiet');
insert into kitchen values(010003,'Ostenfeld Kollegiet');
insert into kitchen values(020001,'Paul Bergsø Kollegiet');
insert into kitchen values(020002,'Paul Bergsø Kollegiet');
insert into kitchen values(020003,'Paul Bergsø Kollegiet');
# Size, monthly fee, dorm
insert into room_rent values(12,2500,'Kampsax Kollegiet');
insert into room_rent values(12,2500,'Paul Bergsø Kollegiet');
insert into room_rent values(24,4000,'Paul Bergsø Kollegiet');
insert into room_rent values(18,2500,'Ostenfeld Kollegiet');
insert into room_rent values(30,4000,'Ostenfeld Kollegiet');
# ID, kitchen, name, size (Kampsax)
insert into room values(080001,000008,'801',12);
insert into room values(080006,000008,'806',12);
insert into room values(080009,000008,'809',12);
insert into room values(080009,000008,'802',12);
# Ostenfeld
insert into room values(010111,010002,'111',12);
insert into room values(010211,010002,'220',12);
# Bergsøe
insert into room values(030033,020003,'300',24);
insert into room values(020001,020002,'200',12);
insert into educational_institution values('Danmarks Tekniske Universitet','Anker Engelundsvej','1',2800);
insert into educational_institution values('Københavns Universitet','Nørregade','10',1165);
insert into educational_institution values('Roskilde Universitet','Universitetsvej','1',4000);
# Student CPR, name, surname, phone, university 
insert into student values(201290213,'Thomas','Malowanczyk',30316331,'Danmarks Tekniske Universitet');
insert into student values(200888233,'Anne','Sloth',23506054,'Danmarks Tekniske Universitet');
insert into student values(270292361,'Henriette','Steenhoff',26661248,'Danmarks Tekniske Universitet');
insert into student values(230242341,'Sandra','Bulovatic',24551243,'Københavns Universitet');
insert into student values(270235531,'Anders','Sperling',40661258,'Danmarks Tekniske Universitet');
#Room ID, Start date, End date, Student CPR
insert into renting values(080001,180208,160511,201290213);
insert into renting values(080009,100110,160511,270292361);
insert into renting values(010111,120404,160303,200888233);
# Student CPR, dorm, start date, street name, no, post code
insert into signed_up values(201290213,'Kampsax Kollegiet',020312,1.00,'xx','34',2800);
insert into signed_up values(270292361,'Ostenfeld Kollegiet',040415,5.00,'xx','25',2800);
insert into signed_up values();
