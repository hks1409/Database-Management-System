REM   Script: Triggers
REM   DBMS Lab 11

Create table employee(e_id int, e_name varchar2(20), city varchar2(20), e_salary int);

Insert into employee values(101,'Harsh','Delhi',2000);

Insert into employee values(102,'Himanshi','Mumbai',3000);

Insert into employee values(103,'Mohit','Chandigarh',1500);

Insert into employee values(104,'Abhishek','Indore',6000);

Insert into employee values(105,'Ankita','Bhopal',3000);

Select * from employee;

CREATE OR REPLACE TRIGGER display_salary_changes  
BEFORE DELETE OR INSERT OR UPDATE ON employee  
FOR EACH ROW  
WHEN (NEW.e_id > 0)  
DECLARE  
   sal_diff number;  
BEGIN  
   sal_diff := :NEW.e_salary  - :OLD.e_salary;  
   dbms_output.put_line('Old salary: ' || :OLD.e_salary);  
   dbms_output.put_line('New salary: ' || :NEW.e_salary);  
   dbms_output.put_line('Salary difference: ' || sal_diff);  
END;  

/

Insert into employee values (106,'Kriti','Faridabad',7500);

UPDATE employee  
SET e_salary = e_salary + 500 WHERE e_id <= 103;

