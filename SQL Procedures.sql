/**
** SQL Procedures
**/
# Procedures are called with: call <procedure name>.

delimiter //
/**
** Procedure for updating the amount to be paid as rent
**/
drop procedure if exists update_rent//
create procedure update_rent(in r_size int(11), in new_rent decimal(8,2), d_name varchar(45))
begin
	update room_rent set monthly_fee = new_rent
	where room_rent.Room_size = r_size and room_rent.dorm_name = d_name;
end; //


/**
** Moves a student form the signed_up table to moving_in
**/
drop procedure if exists moving_in//
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

/**
** Procedure for moving internally in dorm
**/
drop procedure if exists move_internally//
create procedure move_internally(in old_room_id int(11), in new_room_id int(11))
begin
IF isAvailableRoom(new_room_id) THEN
update renting set Room_ID = new_room_id;
call moving_out((select CPR_no from renting where Room_ID = old_room_id), old_room_id);
end IF;
end; //

/**
** Procedure for updating relocation date by room ID
**/
drop procedure if exists update_relocation_date//
create procedure update_relocation_date(in room_id int(11), in new_relocation_date date)
begin
	IF now() - new_relocation_date > 0 THEN
	update renting set End_date = new_relcation_date
	where room_ID = room_id;
end IF;
end;//
/**
** Delete a studen from renting
**/
drop procedure if exists vacate//
create procedure vacate(in CPR INT(10), room_id INT)
begin
    # Delete from signed_up
    delete from renting
    where renting.CPR_no = CPR;
end; //

delimiter ;
	
