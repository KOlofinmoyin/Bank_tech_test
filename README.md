Bank - Tech test
=================

[Image to go here :)]

## Specification
1. Users should be able to interact with the code via a REPL e.g. IRB or the JavaScript console.
2. Features: Deposits, withdrawal, Printing, Account statement (date, amount, balance) printing. Data can be kept in memory (it doesn't need to be stored to a database or anything).

```
(Original) Acceptance criteria
===================
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User Stories:

```
   Feature: Bank App. - Deposit functionality
     As a client User of the Bank app.
     I want to interact with an account
     So That I can make a deposit to it.

     Scenario: Make Deposit
       Given I am on the 'make deposit' section of the app.
       When I enter my deposit amount
       And click 'Enter' to confirm
       Then my deposit amount is added to my account 'balance'
       And the amount is entered into a 'credit' history
       And my deposit 'date' is stored

   Feature: Bank App. - Withdrawal functionality
     As a client User of the Bank app.
     I want to interact with an account
     So That I can make a withdrawal from it.

     Scenario: Make Withdrawal
       Given I am on the 'make withdrawal' section of the app.
       When I enter my withdrawal amount
       And Click enter to confirm
       Then my withdrawal amount is deducted from my account 'balance'
       And and the amount is entered into a 'debit' history
       And and my withdrawal 'date' is stored

   Feature: Bank App. - Print functionality
     As a client User of the Bank app.
     I want to interact with an account
     So That I can print its statement.

     Scenario: Print Bank statement
       Given I am on the options section of the app.
       When I select the 'Print bank statement' option
       Then all my deposit history
       And all my withdrawal history is displayed in the formate 'date' | 'credit' | 'debit | 'balance'
```

### Test Plan:
#### Make a Deposit
```
INPUT       |     OUTPUT
1000 on 16-12-2016     ->     "You've deposited 1000.00 on 16/12/2012 and your balance is: 1000.00"
2000 on 17-12-2016     ->     "You've deposited 2000.00 on 17/12/2012 and your balance is: 3000.00"
```

#### Make a Withdrawal
```
INPUT       |     OUTPUT
500 on 16-12-2016     ->     "You've withdrawn 500 on 16/12/2012 and your balance is: 2500"
500 on 17-12-2016     ->     "You've withdrawn 500 on 17/12/2012 and your balance is: 2000"
```

#### PrintStatement
INPUT       |     OUTPUT
"Print" ->        date || credit || debit || balance

"Print" ->        date || credit || debit || balance
                  17/12/2019  || || 500.00 || 2000.00

"Print" ->        date || credit || debit || balance
                  17/12/2019  || 2000.00 || || 2500.00


"Print" ->        date || credit || debit || balance
                  17/12/2012 || || 500.00 || 2000.00
                  17/12/2012 || 2000.00 || || 2500.00            
                  16/12/2012 || || 500.00 || 500.00            
                  16/12/2012 || 1000.00 || || 1000.00
