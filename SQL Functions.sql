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
where Edu_name = uni group by Dorm_Name;
RETURN uni_count;
END;//

delimiter ;	