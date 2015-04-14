/**
** SQL Procedures
**/
# Procedures are called with: call <procedure name>.

delimiter //

drop procedure if exists update_rent//
create procedure update_rent(in r_size int(11), in new_rent decimal(8,2), d_name varchar(45))
begin
	update room_rent set monthly_fee = new_rent
    where room_rent.Room_size = r_size and room_rent.dorm_name = d_name;
	#insert into room_rent(room_size, monthly_fee, dorm_name) values (room_size, new_rent, dorm_name);
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

