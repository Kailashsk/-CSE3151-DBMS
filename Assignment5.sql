/*
Name: Kailash Chandra Sahu
Regd No: 2161020058
Desc: Assignment 5
Branch: MCA
*/

No1.
1) select name, phone_no, cust_no from CUSTOMER natural join DEPOSITOR where DEPOSITOR.account_no = 'A0004';

   select name, phone_no, cust_no from CUSTOMER where cust_no in (select cust_no from DEPOSITOR where account_no = 'A0004');

2) select amount, branch_code from LOAN natural join CUSTOMER where CUSTOMER.name = 'YASH SARAF';

   select amount, branch_code from LOAN where cust_no in (select cust_no from CUSTOMER where name = 'YASH SARAF');

3) select CUSTOMER.name from CUSTOMER left join LOAN on CUSTOMER.cust_no = LOAN.cust_no where LOAN.cust_no is NULL;

  select name from CUSTOMER where cust_no not in (select cust_no from LOAN);

4) select account_no, balance from ACCOUNT natural join DEPOSITOR where DEPOSITOR.cust_no = 'C0010';

  select account_no, balance from ACCOUNT where account_no in (select account_no from DEPOSITOR where cust_no = 'C0010');

5) select distinct CUSTOMER.city from CUSTOMER self join CUSTOMER on CUSTOMER.name = 'ASLESHA TIWARI';

  select city from CUSTOMER where cust_no in (select cust_no from CUSTOMER where name = 'ASLESHA TIWARI');

6) select type, branch_code from ACCOUNT natural join DEPOSITOR where DEPOSITOR.cust_no = 'C0002';

  select type, branch_code from ACCOUNT where account_no in (select account_no from DEPOSITOR where cust_no = 'C0002');

7) select account_no, balance from ACCOUNT where type = 'SB';

8) select *from INSTALLMENT where loan_no in (select loan_no from LOAN where cust_no = 'C0001');

  select *from INSTALLMENT natural join LOAN where LOAN.cust_no = 'C0001';

P.S. select *from (select *from ACCOUNT order by balance desc) where ROWNUM = 1;

No2.
a) select name, phone_no from CUSTOMER natural join DEPOSITOR, ACCOUNT where DEPOSITOR.account_no = ACCOUNT.account_no and ACCOUNT.balance > 100000;

b) select loan_no from LOAN natural join BRANCH where BRANCH.branch_city = 'MUMBAI';

  --Alternate Method--
  select LOAN.loan_no from LOAN, BRANCH where LOAN.branch_code = BRANCH.branch_code AND BRANCH.branch_city = 'MUMBAI';

c) select phone_no from CUSTOMER natural join DEPOSITOR, ACCOUNT, BRANCH where DEPOSITOR.account_no = ACCOUNT.account_no and ACCOUNT.branch_code = BRANCH.branch_code and BRANCH.branch_name = 'SALTLAKE BRANCH';

  select phone_no from CUSTOMER, DEPOSITOR, ACCOUNT, BRANCH where CUSTOMER.cust_no = DEPOSITOR.cust_no AND DEPOSITOR.account_no = ACCOUNT.account_no AND ACCOUNT.branch_code = BRANCH.branch_code AND BRANCH.branch_name = 'SALTLAKE BRANCH';

d) select distinct name from CUSTOMER natural join LOAN, INSTALLMENT where LOAN.loan_no = INSTALLMENT.loan_no and INSTALLMENT.inst_amount = 500000;
  
  select distinct name from CUSTOMER, LOAN, INSTALLMENT where CUSTOMER.cust_no = LOAN.cust_no AND LOAN.loan_no = INSTALLMENT.loan_no AND INSTALLMENT.inst_amount = 500000;

e) select distinct name from CUSTOMER natural join DEPOSITOR, ACCOUNT where DEPOSITOR.account_no = ACCOUNT.account_no and ACCOUNT.type<>'SB';

  select distinct name from CUSTOMER, DEPOSITOR, ACCOUNT where CUSTOMER.cust_no = DEPOSITOR.cust_no AND DEPOSITOR.account_no = ACCOUNT.account_no AND ACCOUNT.type != 'SB';
  /* != , <> are Not Equal operators */

f) select type, sum(balance) from ACCOUNT natural join DEPOSITOR, CUSTOMER where DEPOSITOR.cust_no = CUSTOMER.cust_no and CUSTOMER.name = 'SWAROOP RAY' group by ACCOUNT.type; 
 
  select ACCOUNT.type, sum(ACCOUNT.balance) from ACCOUNT, DEPOSITOR, CUSTOMER where DEPOSITOR.account_no = ACCOUNT.account_no AND DEPOSITOR.cust_no = CUSTOMER.cust_no AND CUSTOMER.name= 'SWAROOP RAY' group by ACCOUNT.type;

g) select inst_no, inst_amount from INSTALLMENT natural join LOAN, CUSTOMER where LOAN.cust_no = CUSTOMER.cust_no and CUSTOMER.name = 'RAJ ANAND SINGH'; 

  select I.inst_no, I.inst_amount from CUSTOMER C, LOAN L, INSTALLMENT I where C.cust_no = L.cust_no AND L.loan_no = I.loan_no AND C.name = 'RAJ ANAND SINGH';

h) select branch_name, branch_city from BRANCH natural join ACCOUNT, DEPOSITOR, CUSTOMER where ACCOUNT.account_no = DEPOSITOR.account_no and DEPOSITOR.cust_no = CUSTOMER.cust_no and CUSTOMER.name = 'ABHIJIT MISHRA'; 

  select B.branch_name, B.branch_city from BRANCH B, CUSTOMER C, DEPOSITOR D, ACCOUNT A where C.cust_no = D.cust_no AND D.account_no = A.account_no AND A.branch_code = B.branch_code AND C.name = 'ABHIJIT MISHRA';

i) select distinct C.name, B.branch_name, L.amount from CUSTOMER C natural join LOAN L, INSTALLMENT I, BRANCH B where L.branch_code = B.branch_code and L.loan_no not in (select loan_no from INSTALLMENT);
