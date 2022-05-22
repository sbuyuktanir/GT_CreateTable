create or replace procedure proc_customer is
  v_cnt1 number;
begin
    
  select count(*) into v_cnt1
  from all_tables
  where owner = 'Bueyuektanir' and
      table_name = 'customer2';

  if v_cnt1 = 0 then 
    execute immediate 'create table customer2
      (
      customer_id int,
      email varchar(45),
      firstname varchar(40),
      lastname varchar(40),
      gender varchar(20),
      birthdate date,
      credit decimal(4)
      )';
    commit;
  end if;
  
    select count(*) into v_cnt1
  from all_sequences
  where sequence_owner = 'Bueyuektanir' and
      sequence_name = 'seq_customer_id2';
      
  if v_cnt1 = 0 then 
    execute immediate 'create sequence seq_customer_id2
      start with 10000
      increment by 1
      cache 50';
    commit;
  end if;
      
end proc_customer;