 create database Bank_Analytics;
 use Bank_Analytics;
 
 CREATE TABLE finance_data1 (
    id INT,
    member_id INT,
    loan_amnt INT,
    funded_amnt INT,
    funded_amnt_inv DECIMAL(10,3),
    term VARCHAR(20),
    int_rate DECIMAL(10,6),
    installment DECIMAL(12,4),
    grade VARCHAR(5),
    sub_grade VARCHAR(5),
    emp_length VARCHAR(20),
    home_ownership VARCHAR(20),
    annual_inc INT,
    verification_status VARCHAR(50),
    issue_d DATE,
    loan_status VARCHAR(50),
    pymnt_plan VARCHAR(5),
    purpose VARCHAR(50),
    zip_code VARCHAR(10),
    addr_state VARCHAR(10),
    dti DECIMAL(10,4)
);
 
 drop table finance_data1;
 drop table finance_data2;
 
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bank Finance Cleaned 1.csv'
INTO TABLE finance_data1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
@id, @member_id, @loan_amnt, @funded_amnt, @funded_amnt_inv,
@term, @int_rate, @installment, @grade, @sub_grade,
@emp_length, @home_ownership, @annual_inc, @verification_status,
@issue_d, @loan_status, @pymnt_plan, @purpose, @zip_code, @addr_state, @dti
)
SET
id = @id,
member_id = @member_id,
loan_amnt = @loan_amnt,
funded_amnt = @funded_amnt,
funded_amnt_inv = @funded_amnt_inv,
term = trim(@term),
int_rate = @int_rate,
installment = @installment,
grade = @grade,
sub_grade = @sub_grade,
emp_length = @emp_length,
home_ownership = @home_ownership,
annual_inc = @annual_inc,
verification_status = @verification_status,
issue_d = STR_TO_DATE(@issue_d, '%d-%m-%Y'),
loan_status = @loan_status,
pymnt_plan = @pymnt_plan,
purpose = @purpose,
zip_code = @zip_code,
addr_state = @addr_state,
dti = @dti;



select count(id) from finance_data1;


CREATE TABLE finance_data2 (
    id INT,
    delinq_2yrs INT,
    earliest_cr_line DATE,
    inq_last_6mths INT,
    mths_since_last_delinq INT,
    mths_since_last_record INT,
    open_acc INT,
    pub_rec INT,
    revol_bal INT,
    revol_util DECIMAL(10,6),
    total_acc INT,
    initial_list_status VARCHAR(5),
    out_prncp DECIMAL(12,2),
    out_prncp_inv DECIMAL(12,2),
    total_pymnt DECIMAL(12,6),
    total_pymnt_inv DECIMAL(12,6),
    total_rec_prncp DECIMAL(12,6),
    total_rec_int DECIMAL(12,6),
    total_rec_late_fee DECIMAL(16,10),
    recoveries DECIMAL(10,3),
    collection_recovery_fee DECIMAL(18,10),
    last_pymnt_d DATE,
    last_pymnt_amnt DECIMAL(12,6),
    last_credit_pull_d DATE
);

 LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bank Finance Cleaned 2.csv'
INTO TABLE finance_data2
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
@id,
@delinq_2yrs,
@earliest_cr_line,
@inq_last_6mths,
@mths_since_last_delinq,
@mths_since_last_record,
@open_acc,
@pub_rec,
@revol_bal,
@revol_util,
@total_acc,
@initial_list_status,
@out_prncp,
@out_prncp_inv,
@total_pymnt,
@total_pymnt_inv,
@total_rec_prncp,
@total_rec_int,
@total_rec_late_fee,
@recoveries,
@collection_recovery_fee,
@last_pymnt_d,
@last_pymnt_amnt,
@last_credit_pull_d
)
SET
id = CAST(@id AS UNSIGNED),

delinq_2yrs = NULLIF(@delinq_2yrs, ''),
earliest_cr_line = STR_TO_DATE(NULLIF(@earliest_cr_line, ''), '%d-%m-%Y'),

inq_last_6mths = NULLIF(@inq_last_6mths, ''),

mths_since_last_delinq = NULLIF(NULLIF(TRIM(@mths_since_last_delinq), ''), 'null'),
mths_since_last_record = NULLIF(NULLIF(TRIM(@mths_since_last_record), ''), 'null'),

open_acc = NULLIF(@open_acc, ''),
pub_rec = NULLIF(@pub_rec, ''),

revol_bal = NULLIF(@revol_bal, ''),
revol_util = NULLIF(@revol_util, ''),

total_acc = NULLIF(@total_acc, ''),
initial_list_status = TRIM(@initial_list_status),

out_prncp = NULLIF(@out_prncp, ''),
out_prncp_inv = NULLIF(@out_prncp_inv, ''),
total_pymnt = NULLIF(TRIM(REPLACE(REPLACE(@total_pymnt, '\r',''), '\n','')), ''),
total_pymnt_inv = NULLIF(@total_pymnt_inv, ''),

total_rec_prncp = NULLIF(@total_rec_prncp, ''),
total_rec_int = NULLIF(@total_rec_int, ''),
total_rec_late_fee = NULLIF(TRIM(REPLACE(REPLACE(@total_rec_late_fee, '\r',''), '\n','')), ''),

recoveries = NULLIF(TRIM(REPLACE(REPLACE(@recoveries, '\r',''), '\n','')), ''),
collection_recovery_fee = NULLIF(TRIM(REPLACE(REPLACE(@collection_recovery_fee, '\r',''), '\n','')), ''),

last_pymnt_d =  STR_TO_DATE(NULLIF(@last_pymnt_d, ''), '%d-%m-%Y'),
last_pymnt_amnt = NULLIF(@last_pymnt_amnt, ''),
last_credit_pull_d = STR_TO_DATE(NULLIF(
	NULLIF(
            TRIM(REPLACE(REPLACE(@last_credit_pull_d, '\r', ''), '\n', '')),''), 
    'null'),
'%d-%m-%Y');



-- Total Loan Amount        
select concat(round(sum(loan_amnt)/1000000,3),'M') as "Total Loan Amount" from finance_data1;

-- Total Loans
select count(id) as 'No.of Loans' from finance_data1;

-- Total Payment recieved
select concat(round(sum(total_pymnt)/1000000,3),'M') as "Total Payment Recieved" from finance_data2;

-- Average Interest Rate
select concat(round(Avg(int_rate)*100,2),'%') as "Average Interest Rate" from finance_data1;

-- Total Interest Recieved
select concat(round(sum(total_rec_int)/1000000,2),'M') as "Total Interest Recieved" from finance_data2;

-- year wise loan Amount Trend
select year(issue_d) as Year,concat(round(sum(loan_amnt)/1000000,2),'M') as "Total Loan Amount" 
from finance_data1
group by 1
order by 1;

-- Grade wise Revol_Bal
select f1.grade,
    concat(round(sum(f2.revol_bal)/1000000,2),'M')  as 'Revol Balance'
from finance_data1 f1
join finance_data2 f2
on f1.id=f2.id
group by 1
order by 1;

-- Grade and Subgrade wise Revol_Bal
select f1.grade,
	f1.sub_grade,
    concat(round(sum(f2.revol_bal)/1000000,2),'M')  as 'Revol Balance'
from finance_data1 f1
join finance_data2 f2
on f1.id=f2.id
group by 1,2
order by 1;


-- Total Payment for Verified Status Vs Non Verified Status
select f1.verification_status , concat(round(sum(f2.total_pymnt)/1000000,3),'M') as "Total Payment" 
from finance_data1 f1
join finance_data2 f2
on f1.id=f2.id
group by 1;

-- State wise and month wise loan status
-- state wise loan status
select addr_state as State,
	loan_status,
	count(id) as 'No.of Loans',
    concat(round(sum(loan_amnt)/1000000,2),'M') as "Total Loan Amount" 
from finance_data1
group by 1,2
order by 1;

-- month wise loan status
select month(issue_d) as Month,
	count(id) as 'No.of Loans',
    concat(round(sum(loan_amnt)/1000000,2),'M') as "Total Loan Amount" 
from finance_data1
group by 1
order by 1;

-- Home Ownership vs last Payment Date
select year(f2.last_pymnt_d) as 'Last payment Date', f1.home_ownership , concat(round(sum(f2.total_pymnt)/1000000,2),'M') as 'Total Payment'
from finance_data1 f1
join finance_data2 f2
on f1.id=f2.id
group by 1,2
order by 1;
