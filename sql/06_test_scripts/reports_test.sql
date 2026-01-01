SET SERVEROUTPUT ON; 
BEGIN -- Test A: Get all employees (Sending NULL constraint) 
PAYROLL_REPORT_PKG.EMP_BY_DEPT_REPORT(NULL); -- Test B: Get only IT employees (Sending '10' as constraint) 
PAYROLL_REPORT_PKG.EMP_BY_DEPT_REPORT(10); -- Test C: Get High Earners (Salary between 15,000 and 30,000) 
PAYROLL_REPORT_PKG.SALARY_RANGE_REPORT(15000, 30000); 
END; 
/