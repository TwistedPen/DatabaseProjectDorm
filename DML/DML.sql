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
insert into kitchen values('000008','Kampsax Kollegiet');
insert into kitchen values('000013','Kampsax Kollegiet');
insert into kitchen values('000020','Kampsax Kollegiet');
insert into kitchen values('000044','Kampsax Kollegiet');
insert into kitchen values('010001','Ostenfeld Kollegiet');
insert into kitchen values('010002','Ostenfeld Kollegiet');
insert into kitchen values('010003','Ostenfeld Kollegiet');
insert into kitchen values('010004','Ostenfeld Kollegiet');
insert into kitchen values('020001','Paul Bergsøe Kollegiet');
insert into kitchen values('020002','Paul Bergsøe Kollegiet');
insert into kitchen values('020003','Paul Bergsøe Kollegiet');
insert into kitchen values('020004','Paul Bergsøe Kollegiet');
# Size, monthly fee, dorm
insert into room_rent values(12,2500,'Kampsax Kollegiet');
insert into room_rent values(12,2500,'Paul Bergsøe Kollegiet');
insert into room_rent values(24,4000,'Paul Bergsøe Kollegiet');
insert into room_rent values(18,2500,'Ostenfeld Kollegiet');
insert into room_rent values(30,4000,'Ostenfeld Kollegiet');
# ID, kitchen, name, size 
# Kampsax
insert into room values('080001','000008','801',12);
insert into room values('080006','000008','806',12);
insert into room values('080009','000008','809',12);
insert into room values('080011','000013','809',12);
insert into room values('080012','000013','802',12);
insert into room values('080013','000020','805',12);
# Ostenfeld
insert into room values('010111','010002','111',18);
insert into room values('010211','010002','220',30);
insert into room values('010333','010001','300',18);
insert into room values('010444','010004','400',18);
# Bergsøe
insert into room values('030033','020003','300',24);
insert into room values('020001','020002','200',12);
insert into room values('030044','020003','044',24);
insert into room values('020050','020002','050',12);
# Universities
insert into educational_institution values('Danmarks Tekniske Universitet','Anker Engelundsvej','1',2800);
insert into educational_institution values('Københavns Universitet','Nørregade','10',1165);
insert into educational_institution values('Roskilde Universitet','Universitetsvej','1',4000);
# Student CPR, name, surname, phone, university 
insert into student values('2012902131','Thomas','Malowanczyk',30316331,'Danmarks Tekniske Universitet');
insert into student values('2008882332','Anne','Sloth',23506054,'Danmarks Tekniske Universitet');
insert into student values('2702923614','Henriette','Steenhoff',26661248,'Danmarks Tekniske Universitet');
insert into student values('2302423412','Sandra','Bulovatic',24551243,'Københavns Universitet');
insert into student values('2702355315','Anders','Sperling',40661258,'Danmarks Tekniske Universitet');
insert into student values('0302334566','Peter','Andreassen',25159975,'Roskilde Universitet');
insert into student values('1992050984','Pernille','Sejersen',40661258,'Danmarks Tekniske Universitet');
insert into student values('1402334888','Inge','Blond',28145570,'Roskilde Universitet');
insert into student values('1530050917','Sebastian','Løvgreen',20898002,'Danmarks Tekniske Universitet');
insert into student values('0402314664','Sabine','Hansen',30432201,'Danmarks Tekniske Universitet');
insert into student values('1104902333','Alexander','Duscheck',40848419,'Danmarks Tekniske Universitet');
insert into student values('2365900001','Stephen','Hawking',90111000,'Danmarks Tekniske Universitet');
insert into student values('2410703339','Allan','Turing',30332151,'Danmarks Tekniske Universitet');
insert into student values('2510803335','Steve','Jobs',45532211,'Danmarks Tekniske Universitet');
insert into student values('2410703342','Hanne','Nielson',61236570,'Danmarks Tekniske Universitet');
insert into student values('1212120015','Mads','Lind',34532234,'Danmarks Tekniske Universitet');
insert into student values('1206120042','Mette','Brock',20302234,'Danmarks Tekniske Universitet');
insert into student values('0201222211','Jakob','Henning',20592231,'Danmarks Tekniske Universitet');
insert into student values('0303103437','Stine','Grue',45302210,'Danmarks Tekniske Universitet');
insert into student values('0904123444','Sarah','Andersen',28559031,'Danmarks Tekniske Universitet');
# Room ID, Start date, End date, Student CPR
# Kampsax
insert into renting values('080001',180208,160511,'2012902131');
insert into renting values('080009',100110,160518,'2702923614');
insert into renting values('080011',281208,200512,'2410703342');
insert into renting values('080013',211208,200517,'0201222211');
insert into renting values('080006',211208,200515,'0303103437');
# Ostenfeld
insert into renting values('010111',120404,160305,'2008882332');
insert into renting values('010333',180208,160511,'1992050984');
insert into renting values('010444',020212,160516,'1206120042');
insert into renting values('010211',150111,131217,'0904123444');
# Bergsøe
insert into renting values('020050',130208,160516,'1402334888');
insert into renting values('020001',281208,200515,'1530050917');
insert into renting values('030044',281208,200516,'2510803339');
# Student CPR, dorm, start date, street name, no, post code
insert into signed_up values('1212120015','Kampsax Kollegiet',020312,1.00,'Kollegiebakken','9',2800);
insert into signed_up values('0402314664','Kampsax Kollegiet',030313,10.00,'Kollegiebakken','9',2800);
insert into signed_up values('2365900001','Kampsax Kollegiet',030313,50.00,'Kollegiebakken','9',2800);
insert into signed_up values('2702923614','Ostenfeld Kollegiet',040415,5.00,'Rævehøjve','36',2800);
insert into signed_up values('1104902333','Ostenfeld Kollegiet',020310,8.50,'Rævehøjve','36',2800);
insert into signed_up values('2410703339','Ostenfeld Kollegiet',020310,16.50,'Rævehøjve','36',2800);
insert into signed_up values('2702355315','Paul Bergsøe Kollegiet',150412,6.00,'Skodsborgvej','190',2850);
insert into signed_up values('0302334566','Paul Bergsøe Kollegiet',150412,13.00,'Skodsborgvej','190',2850);