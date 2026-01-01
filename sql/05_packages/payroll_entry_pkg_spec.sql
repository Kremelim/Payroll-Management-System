CREATE OR REPLACE PACKAGE PAYROLL_ENTRY_PKG AS 
    -- Procedure to add a Region 
    PROCEDURE ADD_REGION( 
        p_region_id IN NUMBER, 
        p_region_name IN VARCHAR2 
    ); 
 
    -- Procedure to add a Job 
    PROCEDURE ADD_JOB( 
        p_job_id IN VARCHAR2, 
        p_job_title IN VARCHAR2, 
        p_min_sal IN NUMBER, 
        p_max_sal IN NUMBER 
    ); 
 
    -- Procedure to add a Department 
    PROCEDURE ADD_DEPARTMENT( 
        p_dept_id IN NUMBER, 
        p_dept_name IN VARCHAR2, 
        p_loc_id IN NUMBER 
    ); 
 
    -- Procedure to add an Employee 
    PROCEDURE ADD_EMPLOYEE( 
        p_emp_id IN NUMBER, 
        p_first_name IN VARCHAR2, 
        p_last_name IN VARCHAR2, 
        p_email IN VARCHAR2, 
        p_hire_date IN DATE, 
        p_job_id IN VARCHAR2, 
        p_salary IN NUMBER, 
        p_dept_id IN NUMBER, 
        p_status_id IN NUMBER 
    ); 
END PAYROLL_ENTRY_PKG; 
/