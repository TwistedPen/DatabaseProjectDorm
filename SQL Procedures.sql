/**
** SQL Procedures
**/
# Procedures are called with: call <procedure name>.

delimiter //
create procedure update_rent(in room_size int(11), in new_rent decimal(8,2), dorm_name varchar(45))
begin
insert into room_rent(Room_size, Monthly_fee, Dorm_name) values (room_size, new_rent, dorm_name);
end; //
delimiter ;

