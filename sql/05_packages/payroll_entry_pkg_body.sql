CREATE OR REPLACE PACKAGE BODY PAYROLL_ENTRY_PKG AS 
 
    -- 1. Implementation for Region 
    PROCEDURE ADD_REGION(p_region_id IN NUMBER, p_region_name IN VARCHAR2) IS 
    BEGIN 
        INSERT INTO REGIONS (REGION_ID, REGION_NAME) 
        VALUES (p_region_id, p_region_name); 
        COMMIT; 
    EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            DBMS_OUTPUT.PUT_LINE('Error: Region ID ' || p_region_id || ' already 
exists.'); 
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Error adding region: ' || SQLERRM); 
    END ADD_REGION; 
 
    -- 2. Implementation for Job 
    PROCEDURE ADD_JOB(p_job_id IN VARCHAR2, p_job_title IN VARCHAR2, p_min_sal IN 
NUMBER, p_max_sal IN NUMBER) IS 
    BEGIN 
        INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) 
        VALUES (p_job_id, p_job_title, p_min_sal, p_max_sal); 
        COMMIT; 
    EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN 
            DBMS_OUTPUT.PUT_LINE('Error: Job ID ' || p_job_id || ' already exists.'); 
    END ADD_JOB; 
 
    -- 3. Implementation for Department 
    PROCEDURE ADD_DEPARTMENT(p_dept_id IN NUMBER, p_dept_name IN VARCHAR2, p_loc_id IN 
NUMBER) IS 
    BEGIN 
        INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID) 
        VALUES (p_dept_id, p_dept_name, p_loc_id); 
        COMMIT; 
    END ADD_DEPARTMENT; 
 
    -- 4. Implementation for Employee 
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
    ) IS 
    BEGIN 
        INSERT INTO EMPLOYEES ( 
            EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, 
            JOB_ID, SALARY, DEPARTMENT_ID, STATUS_ID 
        ) VALUES ( 
            p_emp_id, p_first_name, p_last_name, p_email, p_hire_date, 
            p_job_id, p_salary, p_dept_id, p_status_id 
        ); 
        COMMIT; 
    EXCEPTION 
        WHEN OTHERS THEN 
            DBMS_OUTPUT.PUT_LINE('Error adding employee: ' || SQLERRM); 
    END ADD_EMPLOYEE; 
 
END PAYROLL_ENTRY_PKG; 
/ 