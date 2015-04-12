/**
** SQL DML
**/

<<<<<<< HEAD
delete from city;
delete from dorm;
delete from educational_instituion;
delete from kitchen;
delete from renting;
delete from room;
delete from signed_up;
delete from student;
insert into dorm values ('Kampsax Kollegiet','Kollegiebakken 9','2800');
insert into dorm values ('Nybrogårdkollegiet','Nybrovej 304','2800');
insert into dorm values ('Prof. Ostenfeldt Kollegiet','xx','2800');
insert into city values ('2800','Kgs. Lyngby');
=======
# clear tables
delete from city;
delete from dorm;
delete from educational_institution;
delete from kitchen;
delete from renting;
delete from room;
delete from room_rent;
delete from signed_up;
delete from student;


# insert into tables

insert into dorm values('Kampsax Kollegiet','Kollegiebakken', '9', 2800);
insert into dorm values('Paul Bergsø Kollegiet','Skodsborgvej', '190', 2850);
insert into dorm values('Ostenfeld Kollegiet','Rævehøjvej', '36', 2800);
insert into kitchen values(000008,'Kampsax Kollegiet');
insert into kitchen values(000013,'Kampsax Kollegiet');
insert into kitchen values(000020,'Kampsax Kollegiet');
insert into kitchen values(010001,'Ostenfeld Kollegiet');
insert into kitchen values(010002,'Ostenfeld Kollegiet');
insert into kitchen values(010003,'Ostenfeld Kollegiet');
insert into kitchen values(020001,'Paul Bergsø Kollegiet');
insert into kitchen values(020002,'Paul Bergsø Kollegiet');
insert into kitchen values(020003,'Paul Bergsø Kollegiet');
insert into room_rent values(12,'Kampsax Kollegiet',2500);
insert into room_rent values(12,'Paul Bersøg Kollegiet',2500);
insert into room_rent values(24,'Paul Bersøg Kollegiet',4000);
insert into room_rent values(18,'Ostenfeld Kollegiet',2500);
insert into room_rent values(30,'Ostenfeld Kollegiet',4000);
insert into room values(080001,000008,'801',12);
insert into room values(080006,000008,'806',12);
insert into room values(080009,000008,'809',12);
insert into room values(080009,000008,'802',12);
insert into student values(2012902131,'Thomas','Malowanczyk',30316331,'Danmark Tekniske Universitet');
insert into renting values();
insert into signed_up values();
insert into educational_institution values();
insert into city values(2800,'Lyngby');
insert into city values(2850,'Nærum');

>>>>>>> origin/master
