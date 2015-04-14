/*
** Functions
*/
delimiter //
CREATE FUNCTION `noOfRenters`(dormName varchar(45)) RETURNS int(11)
BEGIN
	declare r_count integer;
	select count(*) into r_count from dorm
	where dorm_name = dormName;
	RETURN r_count;
END;//

CREATE FUNCTION `rentersAtUni`(uni varchar(45)) RETURNS int(11)
BEGIN
	declare uni_count integer;
	select count(*) into uni_count from signed_up join educational_institution
	where Edu_name = uni;
	RETURN uni_count;
END;//

 #drop function if exists getAddress;
 CREATE FUNCTION `getAddress`(roomID int(6)) RETURNS varchar(45)
BEGIN
	declare roomNo varchar(45);
	select Street_no 
	into roomNo from (room natural join kitchen) natural join dorm 
	where Room_ID = roomID;
	RETURN concat(Street_name, Street_no, roomNo, substr(Room_ID,4));
END;//

CREATE FUNCTION `getRoomRent`(roomID int(11)) RETURNS DECIMAL(8,2)
BEGIN
	declare rent DECIMAL;
	select Monthly_fee into rent
	from room natural join kitchen natural join dorm natural join room_rent
	where room_ID = roomID;
	RETURN rent;
END;//

CREATE FUNCTION `isAvailableRoom`(roomID int(11)) RETURNS BOOLEAN
BEGIN
	declare flag BOOLEAN;
	set flag = roomID in (select room_ID from available_rooms);
	RETURN flag;
END;//

delimiter ;	