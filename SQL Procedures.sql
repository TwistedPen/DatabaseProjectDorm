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

/**
** Moves a student form the signed_up table to moving_in
**/
create procedure moving_in(in CPR INT(10), room_id INT, s_date DATE, e_date DATE)
begin
	# Insert into renting table
	IF s_date AND e_date IS NOT NULL THEN
		insert into renting values (room_id,s_date,e_date,CPR);
	ELSEIF s_date IS NOT NULL THEN
		insert into renting values (room_id,s_date,null,CPR);
	ELSEIF e_date IS NOT NULL THEN
		insert into renting values (room_id,NOW(),e_Date,CPR);
	ELSE
		insert into renting values (room_id,NOW(),null,CPR);
	END IF;
    
    # Delete from signed_up
    delete from signed_up 
    where signed_up.CPR_no = CPR;
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
end;//
/**
** Delete a studen from renting
**/
create procedure moving_out(in CPR INT(10), room_id INT)
begin
    # Delete from signed_up
    delete from renting
    where signed_up.CPR_no = CPR;
end; //

delimiter ;

