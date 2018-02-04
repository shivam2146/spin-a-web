#Ducs Bank
#Problem statement
Internet Banking System
Description:
A responsive web application wherein a user can access his or her account and do transactions online.
Authentication & Authorization


There will be two types of users – Bank Manager and Customer.
Bank Manager and Customer are expected to have default User ID and Password.
Functional Requirements
BANK MANAGER
Once bank manager logins into the system, he/she should be able to -
View the bank details.
View his/her account details.
View the account details of all the customers of the bank.
View Bank Details

Once the manager logs in into system, bank details should be displayed on the screen.
Bank details includes –
Bank Code
Bank Name
IFSC Code
Address
Email
Phone

View Bank Manager Details
1. Once the manager logs in into system.
2. Clicks on ‘Account Details’, will be redirected to the respective page.
3. Account details of the manager should be displayed.
Bank Manager Details includes -
Manager Id
Manager Name
Address
Email
Phone

View Account Details
1. Once the manager logs in into system.
2. Clicks on ‘Customers, will be redirected to the respective page.
3. Account details of all the customers of the bank should be displayed.
4. Search for a customer by account number should also be there.


CUSTOMER
Assume that the customers are already registered for the internet banking.
Once customer logins into the system, he/she should be able to -
View his/her account details.
Add a beneficiary.
Transfer funds to the registered beneficiary.
View account statement.
View Account Details

Once the customer logs in into their internet banking account, account details should be displayed on the
screen.
Account details includes -
Account Number
CIF Number
Bank Code
Account Type
Balance
Account Start Date
Account Status (active/inactive)*
* This field should only be visible to the bank manager.

Add a Beneficiary
1. Once the customer logs in into their internet banking account.
2. Clicks on ‘Add Beneficiary, will be redirected to the respective page.
3. All the required fields shall be filled by the customer and clicks on ‘Add beneficiary’.
4. Upon successful submission, Beneficiary details shall be added to the customer’s account.
Beneficiary details includes –
Beneficiary Name
Beneficiary Account No
Beneficiary Bank Name
Beneficiary IFSC Code
Transfer Limit

Transfer funds to the registered beneficiary
1. Once the customer logs in into their internet banking account.
2. Clicks on ‘Transfer Funds’, will be redirected to the respective page.
3. In Transfer funds page, beneficiary list will be displayed in the grid view and the list should be
filterable (search for beneficiary by name etc.)
4. Customer selects the beneficiary to whom he or she wants to transfer funds and then fill in all other
details and clicks on ‘Continue’ button.
5. All the details of the beneficiary to whom the money is being transferred will be displayed to the
customer for confirmation.
6. Customer then clicks on ‘Make Payment’ button.
7. Funds will be transferred to the beneficiary and the same amount will be debited from the customer’s
account.

View Account Statement
1. Once the customer logs in into their internet banking account.
2. Clicks on ‘View Account Statement’, will be redirected to the respective page.
3. Customer shall be asked for ‘start date’ and ‘end date’ to generate the statement.
4. If there are some records in the selected date range, those records shall be displayed to the customer in
a grid view.
5. Customer can also download the statement whenever he wants to.
