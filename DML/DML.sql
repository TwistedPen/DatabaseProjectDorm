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
insert into dorm values('Paul Bergsøe Kollegiet','Skodsborgvej', '190', 2850);
insert into dorm values('Ostenfeld Kollegiet','Rævehøjvej', '36', 2800);
# Kitchen ID, dorm name
insert into kitchen values(000008,'Kampsax Kollegiet');
insert into kitchen values(000013,'Kampsax Kollegiet');
insert into kitchen values(000020,'Kampsax Kollegiet');
insert into kitchen values(000044,'Kampsax Kollegiet');
insert into kitchen values(010001,'Ostenfeld Kollegiet');
insert into kitchen values(010002,'Ostenfeld Kollegiet');
insert into kitchen values(010003,'Ostenfeld Kollegiet');
insert into kitchen values(010004,'Ostenfeld Kollegiet');
insert into kitchen values(020001,'Paul Bergsøe Kollegiet');
insert into kitchen values(020002,'Paul Bergsøe Kollegiet');
insert into kitchen values(020003,'Paul Bergsøe Kollegiet');
insert into kitchen values(020004,'Paul Bergsøe Kollegiet');
# Size, monthly fee, dorm
insert into room_rent values(12,2500,'Kampsax Kollegiet');
insert into room_rent values(12,2500,'Paul Bergsøe Kollegiet');
insert into room_rent values(24,4000,'Paul Bergsøe Kollegiet');
insert into room_rent values(18,2500,'Ostenfeld Kollegiet');
insert into room_rent values(30,4000,'Ostenfeld Kollegiet');
# ID, kitchen, name, size 
# Kampsax
insert into room values(080001,000008,'801',12);
insert into room values(080006,000008,'806',12);
insert into room values(080009,000008,'809',12);
insert into room values(080011,000013,'809',12);
insert into room values(080012,000013,'802',12);
insert into room values(080013,000020,'805',12);
# Ostenfeld
insert into room values(010111,010002,'111',18);
insert into room values(010211,010002,'220',30);
insert into room values(010333,010001,'300',18);
insert into room values(010444,010004,'400',18);
# Bergsøe
insert into room values(030033,020003,'300',24);
insert into room values(020001,020002,'200',12);
insert into room values(030044,020003,'044',24);
insert into room values(020050,020002,'050',12);
# Universities
insert into educational_institution values('Danmarks Tekniske Universitet','Anker Engelundsvej','1',2800);
insert into educational_institution values('Københavns Universitet','Nørregade','10',1165);
insert into educational_institution values('Roskilde Universitet','Universitetsvej','1',4000);
# Student CPR, name, surname, phone, university 
insert into student values(201290213,'Thomas','Malowanczyk',30316331,'Danmarks Tekniske Universitet');
insert into student values(200888233,'Anne','Sloth',23506054,'Danmarks Tekniske Universitet');
insert into student values(270292361,'Henriette','Steenhoff',26661248,'Danmarks Tekniske Universitet');
insert into student values(230242341,'Sandra','Bulovatic',24551243,'Københavns Universitet');
insert into student values(270235531,'Anders','Sperling',40661258,'Danmarks Tekniske Universitet');
insert into student values(030233456,'Peter','Andreassen',25159975,'Roskilde Universitet');
insert into student values(199205098,'Pernille','Sejersen',40661258,'Danmarks Tekniske Universitet');
insert into student values(140233488,'Inge','Blond',28145570,'Roskilde Universitet');
insert into student values(153005091,'Sebastian','Løvgreen',20898002,'Danmarks Tekniske Universitet');
insert into student values(040231466,'Sabine','Hansen',30432201,'Danmarks Tekniske Universitet');
insert into student values(110490233,'Alexander','Duscheck',40848419,'Danmarks Tekniske Universitet');
insert into student values(236590000,'Stephen','Hawking',90111000,'Danmarks Tekniske Universitet');
insert into student values(241070333,'Allan','Turing',30332151,'Danmarks Tekniske Universitet');
insert into student values(251080333,'Steve','Jobs',45532211,'Danmarks Tekniske Universitet');
insert into student values(241070334,'Hanne','Nielson',61236570,'Danmarks Tekniske Universitet');
insert into student values(121212001,'Mads','Lind',34532234,'Danmarks Tekniske Universitet');
insert into student values(120612004,'Mette','Brock',20302234,'Danmarks Tekniske Universitet');
insert into student values(020122221,'Jakob','Henning',20592231,'Danmarks Tekniske Universitet');
insert into student values(030310343,'Stine','Grue',45302210,'Danmarks Tekniske Universitet');
insert into student values(090412344,'Sarah','Andersen',28559031,'Danmarks Tekniske Universitet');
# Room ID, Start date, End date, Student CPR
# Kampsax
insert into renting values(080001,180208,160511,201290213);
insert into renting values(080009,100110,160511,270292361);
insert into renting values(080011,281208,200512,241070334);
insert into renting values(080013,211208,200511,020122221);
insert into renting values(080006,211208,200511,030310343);
# Ostenfeld
insert into renting values(010111,120404,160303,200888233);
insert into renting values(010333,180208,160511,199205098);
insert into renting values(010444,020212,160508,120612004);
insert into renting values(010211,010002,131211,090412344);
# Bergsøe
insert into renting values(020050,130208,160516,140233488);
insert into renting values(020001,281208,200512,153005091);
insert into renting values(030044,281208,200512,251080333);
# Student CPR, dorm, start date, street name, no, post code
insert into signed_up values(121212004,'Kampsax Kollegiet',020312,1.00,'Kollegiebakken','9',2800);
insert into signed_up values(040231466,'Kampsax Kollegiet',030313,10.00,'Kollegiebakken','9',2800);
insert into signed_up values(236590000,'Kampsax Kollegiet',030313,50.00,'Kollegiebakken','9',2800);
insert into signed_up values(270292361,'Ostenfeld Kollegiet',040415,5.00,'Rævehøjve','36',2800);
insert into signed_up values(110490233,'Ostenfeld Kollegiet',020310,8.50,'Rævehøjve','36',2800);
insert into signed_up values(241070333,'Ostenfeld Kollegiet',020310,16.50,'Rævehøjve','36',2800);
insert into signed_up values(270235531,'Paul Bergsøe Kollegiet',150412,6.00,'Skodsborgvej','190',2850);
insert into signed_up values(030233456,'Paul Bergsøe Kollegiet',150412,13.00,'Skodsborgvej','190',2850);