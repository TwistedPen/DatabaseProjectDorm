/**
** SQL Procedures
**/
# Procedures are called with: call <procedure name>.

# Procedure for updating the amount to be paid as rent
delimiter //
create procedure update_rent(in room_size int(11), in new_rent decimal(8,2), dorm_name varchar(45))
begin
insert into room_rent(Room_size, Monthly_fee, Dorm_name) values (room_size, new_rent, dorm_name);
end; //

# Procedure for moving internally in dorm
create procedure move_internally(in old_room_id int(11), in new_room_id int(11))
begin
insert into room_rent(Room_size, Monthly_fee, Dorm_name) values (room_size, new_rent, dorm_name);
end; //

# Procedure for updating relocation date by room ID
create procedure update_relocation_date(in room_id int(11), in new_relocation_date date)
begin
update renting set End_date = new_relcation_date where room_ID = room_id;
end; //

delimiter ;

