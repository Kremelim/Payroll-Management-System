CREATE OR REPLACE PACKAGE BODY PAYROLL_REPORT_PKG AS 
 
    -- Implementation of Report 1 
    PROCEDURE EMP_BY_DEPT_REPORT(p_dept_id IN NUMBER DEFAULT NULL) IS 
        -- Cursor that adapts to the input 
        CURSOR c_emps IS 
            SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID 
            FROM EMPLOYEES 
            WHERE (p_dept_id IS NULL OR DEPARTMENT_ID = p_dept_id) 
            ORDER BY EMPLOYEE_ID; 
            
        v_rec c_emps%ROWTYPE; 
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('--- EMPLOYEE DEPARTMENT REPORT ---'); 
        IF p_dept_id IS NOT NULL THEN 
             DBMS_OUTPUT.PUT_LINE('Filtering by Department ID: ' || p_dept_id); 
        ELSE 
             DBMS_OUTPUT.PUT_LINE('Showing All Departments'); 
        END IF; 
        DBMS_OUTPUT.PUT_LINE('----------------------------------'); 
        
        OPEN c_emps; 
        LOOP 
            FETCH c_emps INTO v_rec; 
            EXIT WHEN c_emps%NOTFOUND; 
            
            DBMS_OUTPUT.PUT_LINE( 
                'ID: ' || v_rec.EMPLOYEE_ID || 
                ' | Name: ' || RPAD(v_rec.FIRST_NAME || ' ' || v_rec.LAST_NAME, 20) || 
                ' | Dept: ' || v_rec.DEPARTMENT_ID 
            ); 
        END LOOP; 
        CLOSE c_emps; 
        DBMS_OUTPUT.PUT_LINE('----------------------------------'); 
    END EMP_BY_DEPT_REPORT; 
 
    -- Implementation of Report 2 
    PROCEDURE SALARY_RANGE_REPORT(p_min_sal IN NUMBER, p_max_sal IN NUMBER) IS 
    BEGIN 
        DBMS_OUTPUT.PUT_LINE('--- SALARY RANGE REPORT ---'); 
        DBMS_OUTPUT.PUT_LINE('Range: $' || p_min_sal || ' to $' || p_max_sal); 
        DBMS_OUTPUT.PUT_LINE('---------------------------'); 
        
        FOR r IN ( 
            SELECT FIRST_NAME, LAST_NAME, SALARY, JOB_ID 
            FROM EMPLOYEES 
            WHERE SALARY BETWEEN p_min_sal AND p_max_sal 
            ORDER BY SALARY DESC 
        ) LOOP 
            DBMS_OUTPUT.PUT_LINE( 
                'Name: ' || RPAD(r.FIRST_NAME || ' ' || r.LAST_NAME, 20) || 
                ' | Job: ' || RPAD(r.JOB_ID, 10) || 
                ' | Salary: $' || r.SALARY 
            ); 
        END LOOP; 
        DBMS_OUTPUT.PUT_LINE('---------------------------'); 
    END SALARY_RANGE_REPORT; 
 
END PAYROLL_REPORT_PKG; 
/ 