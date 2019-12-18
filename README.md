Bank - Tech test
=================
An interactive commandline program that receives a user's deposit & withdrawal bank transactions and prints them out to the screen chronologically (descending order).

![bank_tech_test](https://user-images.githubusercontent.com/33905131/71023714-37025000-20fb-11ea-8c9f-8eaad77598e5.gif)

### Using the app.
First, clone this repository. Then:

```
> bundle install
> rspec # Run the tests to ensure it works

> #use irb or REPL to interact with the code.
> require './lib/bank.rb' # require the file
> bank_branch = Bank.new # create a new bank instance
> bank_branch.make_a_deposit('15000.00') # to make a deposit
> bank_branch.withdraw('900.00') # to make a withdrawal
> bank_branch.print_statement # to print out the accounts full transaction history
> exit # to quit
```

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

![bank_tech_test_record_transactions](https://user-images.githubusercontent.com/33905131/71020971-3d8dc900-20f5-11ea-86bd-8477c457fd7d.gif)


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
Test coverage
![Screenshot 2019-12-18 at 15 13 55](https://user-images.githubusercontent.com/33905131/71098093-0973e000-21a9-11ea-94fd-9486427fb797.png)

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
x - "Print" ->        date || credit || debit || balance

x - "Print" ->        date || credit || debit || balance
                  17/12/2019  || || 500.00 || 2000.00

x - "Print" ->        date || credit || debit || balance
                  17/12/2019  || 2000.00 || || 2500.00


"Print" ->        date || credit || debit || balance
                  17/12/2012 || || 500.00 || 2000.00
                  17/12/2012 || 2000.00 || || 2500.00            
                  16/12/2012 || || 500.00 || 500.00            
                  16/12/2012 || 1000.00 || || 1000.00
