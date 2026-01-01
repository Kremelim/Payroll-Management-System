CREATE OR REPLACE PACKAGE BODY PAYROLL_MANAGER_PKG AS 
 
    -- Implementation of Salary Update 
    PROCEDURE UPDATE_SALARY(p_emp_id IN NUMBER, p_new_salary IN NUMBER) IS 
        v_old_salary NUMBER; 
    BEGIN 
        -- First, let's check the current salary to print a nice message later 
        SELECT SALARY INTO v_old_salary 
        FROM EMPLOYEES 
        WHERE EMPLOYEE_ID = p_emp_id; 
 
        -- Perform the Update 
        UPDATE EMPLOYEES 
        SET SALARY = p_new_salary 
        WHERE EMPLOYEE_ID = p_emp_id; 
        
        -- Commit the change 
        COMMIT; 
        
        DBMS_OUTPUT.PUT_LINE('Salary for Employee ' || p_emp_id || 
                             ' updated from ' || v_old_salary || 
                             ' to ' || p_new_salary); 
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN 
            DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || p_emp_id || ' not found.'); 
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Error updating salary: ' || SQLERRM); 
    END UPDATE_SALARY; 
 
END PAYROLL_MANAGER_PKG; 
/ 