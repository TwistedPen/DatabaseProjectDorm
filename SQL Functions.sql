/*
** Functions
*/
delimiter //
CREATE FUNCTION `noOfRenters`(dormName varchar(45)) RETURNS int(11)
BEGIN
declare r_count integer;
select count(*) into r_count from dorm
where D_name = dormName;
RETURN r_count;
END;//

CREATE FUNCTION `rentersAtUni`(uni varchar(45)) RETURNS int(11)
BEGIN
declare uni_count integer;
select count(*) into uni_count from signed_up join educational_institution
where Edu_name = uni group by Dorm_Name;
RETURN uni_count;
END;//

 CREATE FUNCTION `getAddress`(roomID int(6)) RETURNS varchar(45)
BEGIN
declare address varchar(45);
select distinct Street_name, Street_no 
into address from (room natural join kitchen) natural join dorm 
where ID = roomID;
RETURN address;
# missing concatenation of roomID to address
END;//

CREATE FUNCTION `getRoomRent`(roomID int(11)) RETURNS DECIMAL(8,2)
BEGIN
declare rent DECIMAL;
select Monthly_fee into rent
from room natural join kitchen natural join dorm natural join room_rent
where room_ID = roomID;
RETURN rent;
#missing concatenation of roomID to address
END;//

delimiter ;	