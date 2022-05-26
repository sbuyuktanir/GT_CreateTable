create or replace procedure 
proc_new_customer (
      	customer_id out int,
      	email in varchar2,
      	firstname in varchar2,
      	lastname in varchar2,
      	gender in varchar2,
      	birthdate in date,
      	credit in out decimal
      	) is
    begin
    customer_id := seq_customer_id2.nextval;   
    if credit is NULL then
       credit := 10; 
  end if;  
  insert into customer2 values (customer_id, email, firstname, lastname, gender, birthdate, credit);
end proc_new_customer;
