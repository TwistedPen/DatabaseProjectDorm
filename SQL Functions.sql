/*
** Functions
*/
delimiter //
CREATE DEFINER=`root`@`localhost` FUNCTION `noOfRenters`(dormName varchar(45)) RETURNS int(11)
BEGIN
declare r_count integer;
select count(*) into r_count from dorm
where D_name = dormName;
RETURN r_count;
END;//

CREATE DEFINER=`root`@`localhost` FUNCTION `rentersAtUni`(uni varchar(45)) RETURNS int(11)
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

delimiter ;	