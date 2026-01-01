CREATE OR REPLACE PACKAGE BODY DATA_CLEANUP_PKG AS 
 
    PROCEDURE REMOVE_DUPLICATE_EMPLOYEES IS 
    BEGIN 
        -- Loop through all duplicate employees (Same Email, but not the oldest one) 
        FOR r IN ( 
            SELECT EMPLOYEE_ID, EMAIL 
            FROM EMPLOYEES A 
            WHERE ROWID > ( 
                SELECT MIN(ROWID) 
                FROM EMPLOYEES B 
                WHERE A.EMAIL = B.EMAIL 
            ) 
        ) LOOP 
            -- 1. First, delete the automated history record (created by Step 7 
trigger) 
            DELETE FROM JOB_HISTORY WHERE EMPLOYEE_ID = r.EMPLOYEE_ID; 
            
            -- 2. Also delete any other potential child records (just in case) 
            DELETE FROM LEAVE_REQUESTS WHERE EMPLOYEE_ID = r.EMPLOYEE_ID; 
            DELETE FROM ATTENDANCE_LOGS WHERE EMPLOYEE_ID = r.EMPLOYEE_ID; 
            DELETE FROM PAYROLL_TRANSACTIONS WHERE EMPLOYEE_ID = r.EMPLOYEE_ID; 
            DELETE FROM EMPLOYEE_DEDUCTIONS WHERE EMPLOYEE_ID = r.EMPLOYEE_ID; 
 
            -- 3. Now we can safely delete the duplicate Employee 
            DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = r.EMPLOYEE_ID; 
            
            DBMS_OUTPUT.PUT_LINE('Deleted duplicate Employee ID: ' || r.EMPLOYEE_ID || 
' (Email: ' || r.EMAIL || ')'); 
        END LOOP; 
        
        COMMIT; 
        DBMS_OUTPUT.PUT_LINE('Cleanup procedure finished.'); 
        
    EXCEPTION 
        WHEN OTHERS THEN 
            ROLLBACK; 
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM); 
    END REMOVE_DUPLICATE_EMPLOYEES; 
 
END DATA_CLEANUP_PKG; 
/ 