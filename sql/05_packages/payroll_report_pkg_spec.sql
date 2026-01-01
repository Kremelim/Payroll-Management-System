CREATE OR REPLACE PACKAGE PAYROLL_REPORT_PKG AS 
    
    -- Report 1: Filter Employees by Department (Dynamic) 
    PROCEDURE EMP_BY_DEPT_REPORT( 
        p_dept_id IN NUMBER DEFAULT NULL -- Default NULL means "Show All" 
    ); 
 
    -- Report 2: Filter Employees by Salary Range (Dynamic) 
    PROCEDURE SALARY_RANGE_REPORT( 
        p_min_sal IN NUMBER, 
        p_max_sal IN NUMBER 
    ); 
 
END PAYROLL_REPORT_PKG; 
/