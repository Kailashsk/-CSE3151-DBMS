/*
Name: Kailash Chadra Sahu
Regd No: 2161020058
Desc: Assignment 4
Branch: MCA
*/

/* Schema */
create table customer(
    -> CUST_NO char(5) constraint chk_startletter check(CUST_NO like 'C%' and length(CUST_NO)=5) primary key,
    -> Name varchar(20) not null,
    -> Phone_No numeric(10),
    -> City varchar(20));

create table account(
    -> ACCOUNT_NO char(5) constraint chk_startAletter check(ACCOUNT_NO like 'A%' and length(ACCOUNT_NO)=5) primary key,
    -> TYPE varchar(2) check(TYPE IN('SB','FD','CA')),
    -> BALANCE numeric(10) check(BALANCE<10000000),
    -> BRANCH_CODE varchar(4),
    -> foreign key(BRANCH_CODE) REFERENCES BRANCH(BRANCH_CODE));

  create table branch(
  2  branch_code varchar(4) primary key,
  3  branch_name varchar(20) not null,
  4 branch_city varchar(12) check(branch_city in('Delhi','Mumbai','Kolkata','Chennai')));


create table depositor(
    -> CUST_NO char(5),
    -> ACCOUNT_NO char(5),
    -> primary key(CUST_NO,ACCOUNT_NO),
    -> foreign key(CUST_NO) REFERENCES customer(CUST_NO),
    -> foreign key(ACCOUNT_NO) REFERENCES account(ACCOUNT_NO));


create table loan(
    -> LOAN_NO char(5) constraint chk_startLletter check(LOAN_NO like 'L%' and length(LOAN_NO)=5) primary key,
    -> CUST_NO char(5),
    -> foreign key(CUST_NO) REFERENCES customer(CUST_NO),
    -> AMOUNT numeric(10) check(AMOUNT>1000),
    -> BRANCH_CODE char(5),
    -> foreign key(BRANCH_CODE) REFERENCES branch(BRANCH_CODE));

create table installment(
    -> INST_NO numeric(1) check(INST_NO<=10),
    -> LOAN_NO char(5),
    -> primary key(INST_NO,LOAN_NO),
    -> foreign key(LOAN_NO) REFERENCES loan(LOAN_NO),
    -> INST_AMOUNT numeric(15) not null);


/* Data */
insert all
	into CUSTOMER (cust_no, name, phone_no, city) values('C0001', 'RAJ ANAND SINGH', 9861258466, 'DELHI')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0002', 'ANKITA SINGH', 9879958651, 'BANGALORE')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0003', 'SOUMYA JHA', 9885623344, 'MUMBAI')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0004', 'ABHIJIT MISHRA', 9455845425, 'MUMBAI')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0005', 'YASH SARAF', 9665854585, 'KOLKATA')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0006', 'SWAROOP RAY', 9437855466, 'CHENNAI')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0007', 'SURYA NARAYAN PRADHAN', 9937955212, 'GURGAON')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0008', 'PRANAV PRAVEEN', 9336652441, 'PUNE')
	into CUSTOMER (cust_no, name, phone_no, city) values('C0009', 'STUTI MISRA', 7870266534, 'DELHI')
	into CUSTOMER (cust_no, name, city) values('C0010', 'ASLESHA TIWARI', 'MUMBAI')
select *from dual;

insert all
	into BRANCH (branch_code, branch_name, branch_city) values('B001', 'JANAKPURI BRANCH', 'DELHI')
	into BRANCH (branch_code, branch_name, branch_city) values('B002', 'CHANDNICHOWK BRANCH', 'DELHI')
	into BRANCH (branch_code, branch_name, branch_city) values('B003', 'JUHU BRANCH', 'MUMBAI')
	into BRANCH (branch_code, branch_name, branch_city) values('B004', 'ANDHERI BRANCH', 'MUMBAI')
	into BRANCH (branch_code, branch_name, branch_city) values('B005', 'SALTLAKE BRANCH', 'KOLKATA')
	into BRANCH (branch_code, branch_name, branch_city) values('B006', 'SRIRAMPURAM BRANCH', 'CHENNAI')
select *from dual;

insert all
	into ACCOUNT (account_no, balance, branch_code) values('A0001', 200000, 'B003')
	into ACCOUNT (account_no, balance, branch_code) values('A0002', 15000, 'B002')
	into ACCOUNT (account_no, type, balance, branch_code) values('A0003', 'CA', 850000, 'B004')
	into ACCOUNT (account_no, type, balance, branch_code) values('A0004', 'CA', 35000, 'B004')
	into ACCOUNT (account_no, type, balance, branch_code) values('A0005', 'FD', 28500, 'B005')
	into ACCOUNT (account_no, type, balance, branch_code) values('A0006', 'FD', 550000, 'B005')
	into ACCOUNT (account_no, balance, branch_code) values('A0007', 48000, 'B001')
	into ACCOUNT (account_no, balance, branch_code) values('A0008', 7200, 'B002')
	into ACCOUNT (account_no, balance, branch_code) values('A0009', 18750, 'B003')
	into ACCOUNT (account_no, type, balance, branch_code) values('A0010', 'FD', 99000, 'B004')
select *from dual;

insert all
	into DEPOSITOR (account_no, cust_no) values('A0001', 'C0003')
	into DEPOSITOR (account_no, cust_no) values('A0001', 'C0004')
	into DEPOSITOR (account_no, cust_no) values('A0002', 'C0004')
	into DEPOSITOR (account_no, cust_no) values('A0003', 'C0006')
	into DEPOSITOR (account_no, cust_no) values('A0004', 'C0006')
	into DEPOSITOR (account_no, cust_no) values('A0005', 'C0001')
	into DEPOSITOR (account_no, cust_no) values('A0005', 'C0002')
	into DEPOSITOR (account_no, cust_no) values('A0006', 'C0010')
	into DEPOSITOR (account_no, cust_no) values('A0007', 'C0009')
	into DEPOSITOR (account_no, cust_no) values('A0008', 'C0008')
	into DEPOSITOR (account_no, cust_no) values('A0009', 'C0007')
	into DEPOSITOR (account_no, cust_no) values('A0010', 'C0006')
select *from dual;

insert all
	into LOAN (loan_no, cust_no, amount, branch_code) values('L0001', 'C0005', 3000000, 'B006')
	into LOAN (loan_no, cust_no, amount, branch_code) values('L0002', 'C0001', 50000, 'B005')
	into LOAN (loan_no, cust_no, amount, branch_code) values('L0003', 'C0002', 8000000, 'B004')
	into LOAN (loan_no, cust_no, amount, branch_code) values('L0004', 'C0010', 100000, 'B004')
	into LOAN (loan_no, cust_no, amount, branch_code) values('L0005', 'C0009', 9500000, 'B005')
	into LOAN (loan_no, cust_no, amount, branch_code) values('L0006', 'C0008', 25000, 'B006')
select *from dual;

insert all
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0005', '1', 500000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0002', '1', 10000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0003', '1', 50000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0004', '1', 20000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0005', '2', 500000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0006', '1', 30000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0002', '2', 10000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0002', '3', 10000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0003', '2', 50000)
	into INSTALLMENT (loan_no, inst_no, inst_amount) values('L0004', '2', 20000)
select *from dual;
