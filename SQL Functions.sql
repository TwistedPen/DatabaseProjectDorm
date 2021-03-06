/*
** Functions
*/
delimiter //

DROP FUNCTION IF EXISTS `noOfRenters`; //
CREATE FUNCTION `noOfRenters`(dormName varchar(45)) RETURNS int(11)
BEGIN
	declare r_count integer;
	select count(CPR_no) into r_count from dorm natural join kitchen natural join room natural join renting
	where Dorm_name = dormName;
	RETURN r_count;
END;//

DROP FUNCTION IF EXISTS `rentersAtUni`; //
CREATE FUNCTION `rentersAtUni`(uni varchar(45)) RETURNS int(11)
BEGIN
	declare uni_count integer;
	select Dorm_name, count(CPR_no) into uni_count 
    from renting natural join student natural join room natural join kitchen natural join dorm
	where Edu_name = uni group by Dorm_name;
	RETURN uni_count;
END;//

DROP FUNCTION IF EXISTS `getAddress`; //
CREATE FUNCTION `getAddress`(roomID int(6)) RETURNS varchar(45)
BEGIN
	declare roomAddress varchar(45);
	select concat(Street_name," ", Street_no,", ", room.Name)
	into roomAddress from room natural join kitchen natural join dorm 
	where Room_ID = roomID;
	RETURN roomAddress;
END;//

DROP FUNCTION IF EXISTS `getRoomRent`; //
CREATE FUNCTION `getRoomRent`(roomID int(11)) RETURNS DECIMAL(8,2)
BEGIN
	declare rent DECIMAL;
	select Monthly_fee into rent
	from room natural join kitchen natural join dorm natural join room_rent
	where room_ID = roomID;
	RETURN rent;
END;//

DROP FUNCTION IF EXISTS `isAvailableRoom`; //
CREATE FUNCTION `isAvailableRoom`(roomID int(11)) RETURNS BOOLEAN
BEGIN
	declare flag BOOLEAN;
	set flag = roomID in (select room_ID from available_rooms);
	RETURN flag;
END;//

delimiter ;	