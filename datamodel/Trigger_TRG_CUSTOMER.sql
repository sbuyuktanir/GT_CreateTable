create or replace TRIGGER TRG_CUSTOMER
BEFORE INSERT or UPDATE on CUSTOMER2
FOR EACH ROW
DECLARE
BEGIN
  IF (INSERTING) THEN
    IF ((:new.CREDIT < 0)) THEN
          raise_application_error (-20999, 'The credits has to be greater or equal to 0!');
    END IF;  
    IF (:new.BIRTHDATE  > SYSDATE) THEN
         raise_application_error (-20998, 'The birthdate must be below the current date!');
    END IF;
  END IF;
  IF (UPDATING) THEN
    :new.BIRTHDATE := :old.BIRTHDATE;
   -- IF (:old.BIRTHDATE <> :new.BIRTHDATE) THEN
   --  raise_application_error (-20997, 'The birthdate cannot be updated!');
   -- END IF;
    IF (:new.EMAIL  NOT LIKE '*@*') THEN
         raise_application_error (-20996, 'The new Email ' || :new.EMAIL || ' must contain @ ' );
    END IF;
  END IF;
END TRG_CUSTOMER;
