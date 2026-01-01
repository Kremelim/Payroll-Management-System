CREATE OR REPLACE TRIGGER TRG_LOG_NEW_HIRE 
AFTER INSERT ON EMPLOYEES 
FOR EACH ROW 
BEGIN 
    -- Insert a record into the transaction table automatically 
    INSERT INTO JOB_HISTORY ( 
        HISTORY_ID, 
        EMPLOYEE_ID, 
        START_DATE, 
        END_DATE, 
        JOB_ID, 
        DEPARTMENT_ID 
    ) VALUES ( 
        JOB_HISTORY_SEQ.NEXTVAL, -- Generate new ID 
        :NEW.EMPLOYEE_ID,        -- Use the ID of the new employee 
        :NEW.HIRE_DATE,          -- Use the hire date 
        NULL,                    -- No end date yet 
        :NEW.JOB_ID,             -- Use the job they were hired for 
        :NEW.DEPARTMENT_ID       -- Use the department they joined 
    ); 
END; 
/