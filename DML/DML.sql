/**
** SQL DML
**/

# clear tables
delete from city;
delete from dorm;
delete from educational_institution;
delete from kitchen;
delete from renting;
delete from room;
delete from signed_up;
delete from student;


# insert into tables

insert into dorm values('Kampsax Kollegiet','Kollegiebakken', '9', 2800);
insert into dorm values('Bergsø Kollegiet','Skodsborgvej', '190', 2850);
insert into dorm values('Ostenfeld Kollegiet','Rævehøjvej', '36', 2800);
insert into kitchen values(000008,'Kampsax Kollegiet');
insert into kitchen values(000013,'Kampsax Kollegiet');
insert into kitchen values(000020,'Kampsax Kollegiet');
insert into kitchen values(010001,'Ostenfeld Kollegiet');
insert into kitchen values(010002,'Ostenfeld Kollegiet');
insert into kitchen values(010003,'Ostenfeld Kollegiet');
insert into kitchen values(020001,'Bergsø Kollegiet');
insert into kitchen values(020002,'Bergsø Kollegiet');
insert into kitchen values(020003,'Bergsø Kollegiet');
insert into room values(080001,'806',12,2500);
insert into room values(080006);
insert into room values(080009);
insert into room values(130001);
insert into room values(200001);
insert into student values();
insert into renting values();
insert into signed_up values();
insert into educational_institution values();
insert into city values(2800,'Lyngby');
insert into city values(2850,'Nærum');
