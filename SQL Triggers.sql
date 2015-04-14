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
delimiter ;