/*
** SQL Triggers
*/
delimiter //
/*
* makes sure that end date is not in the past
*/ 
DROP TRIGGER IF EXISTS end_date_check_insert;//
create trigger end_date_check_insert
before insert on renting for each row
begin
	if new.end_date <= NOW() then set new.end_date = null;
    end if;    
end; //

/*
* makes sure that end date is not in the past
*/ 
DROP TRIGGER IF EXISTS end_date_check_update;//
create trigger end_date_check_update
before update on renting for each row
begin
	if new.end_date <= NOW() then 
		set new.end_date = null;
    end if;    
end; //

/*
* logs the student info along with the room info for when vacated from a room
*/ 
DROP TRIGGER IF EXISTS vacatelog_insert;//
create trigger vacatelog_insert
after delete on renting for each row
begin
	declare d_name varchar(45);
    declare k_ID int;
    
    select dorm_name
    from room natural join kitchen natural join dorm 
    where room.Room_id = OLD.Room_ID INTO d_name;
    
    select kitchen_ID
    from room natural join kitchen natural join dorm 
    where room.Room_id = OLD.Room_ID INTO k_ID;
    
	insert into vacatelog values (OLD.CPR_no, d_name, k_ID, OLD.Room_id, OLD.end_date, NOW());
end; //

/*
* logs the student info along with the room info for when moved in to a room
*/ 
DROP TRIGGER IF EXISTS movinginlog_insert;//
create trigger movinginlog_insert
after insert on renting for each row
begin
	declare d_name varchar(45);
    declare k_ID int;
    
    select dorm_name
    from room natural join kitchen natural join dorm 
    where room.Room_id = NEW.Room_ID INTO d_name;
    
    select kitchen_ID
    from room natural join kitchen natural join dorm 
    where room.Room_id = NEW.Room_ID INTO k_ID;
    
	insert into movinginlog values (NEW.CPR_no, d_name, k_ID, NEW.Room_id, NEW.Start_date, NOW());
end; //
delimiter ;