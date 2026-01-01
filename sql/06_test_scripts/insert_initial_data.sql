SET SERVEROUTPUT ON; 
 
BEGIN 
    -- A. Setup Lookup Data (Safe Inserts) 
    
    -- 1. Regions (Handled by Package Exception, but calling here) 
    PAYROLL_ENTRY_PKG.ADD_REGION(1, 'Americas'); 
    PAYROLL_ENTRY_PKG.ADD_REGION(2, 'EMEA'); 
    
    -- 2. Countries (Wrapped to ignore duplicates) 
    BEGIN 
        INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('US', 
'United States', 1); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; -- Ignore if exists 
    END; 
    
    BEGIN 
        INSERT INTO COUNTRIES (COUNTRY_ID, COUNTRY_NAME, REGION_ID) VALUES ('UK', 
'United Kingdom', 2); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
    
    -- 3. Locations 
    BEGIN 
        INSERT INTO LOCATIONS VALUES (100, '2004 Charade Rd', '98199', 'Seattle', 
'Washington', 'US'); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
    
    BEGIN 
        INSERT INTO LOCATIONS VALUES (200, '8204 Arthur St', 'SW1 4RW', 'London', 
NULL, 'UK'); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
    
    -- 4. Statuses 
    BEGIN 
        INSERT INTO STATUSES VALUES (1, 'Active'); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
    
    BEGIN 
        INSERT INTO STATUSES VALUES (2, 'On Leave'); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
    
    -- B. Use Package to add Jobs 
    -- (The package already has exception handling, so these are safe) 
    PAYROLL_ENTRY_PKG.ADD_JOB('IT_PROG', 'Programmer', 4000, 10000); 
    PAYROLL_ENTRY_PKG.ADD_JOB('HR_REP', 'HR Representative', 4000, 9000); 
    PAYROLL_ENTRY_PKG.ADD_JOB('AD_PRES', 'President', 20000, 40000); 
    
    -- C. Use Package to add Departments 
    -- (We will add a quick check inside the calls or just rely on the DB not 
crashing) 
    BEGIN 
        PAYROLL_ENTRY_PKG.ADD_DEPARTMENT(10, 'IT', 100); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
 
    BEGIN 
        PAYROLL_ENTRY_PKG.ADD_DEPARTMENT(20, 'Human Resources', 200); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
    
    BEGIN 
        PAYROLL_ENTRY_PKG.ADD_DEPARTMENT(30, 'Executive', 100); 
    EXCEPTION WHEN DUP_VAL_ON_INDEX THEN NULL; 
    END; 
 
    -- D. Use Package to add Employees 
PAYROLL_ENTRY_PKG.ADD_EMPLOYEE(101, 'Steven', 'King', 'SKING', SYSDATE-3650, 
'AD_PRES', 24000, 30, 1); 
PAYROLL_ENTRY_PKG.ADD_EMPLOYEE(102, 'Nina', 'Kochhar', 'NKOCHHAR', SYSDATE-2000, 
'HR_REP', 17000, 20, 1); 
PAYROLL_ENTRY_PKG.ADD_EMPLOYEE(103, 'Lex', 'De Haan', 'LDEHAAN', SYSDATE-1500, 
'IT_PROG', 9000, 10, 1); 
PAYROLL_ENTRY_PKG.ADD_EMPLOYEE(104, 'Alexander', 'Hunold', 'AHUNOLD', SYSDATE-100, 
'IT_PROG', 6000, 10, 2); 
DBMS_OUTPUT.PUT_LINE('Data Entry Complete (Duplicates Ignored).'); 
END; 
/ 
