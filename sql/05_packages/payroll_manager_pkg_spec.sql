CREATE OR REPLACE PACKAGE PAYROLL_MANAGER_PKG AS 
    -- Step 5: Procedure to Update Salary 
    PROCEDURE UPDATE_SALARY( 
        p_emp_id IN NUMBER, 
        p_new_salary IN NUMBER 
    ); 
END PAYROLL_MANAGER_PKG; 
/ 