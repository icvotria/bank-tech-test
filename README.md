# Bank Tech Test

Makers code quality week, first test.

The specifications of the challenge can be found in CHALLENGE.md.

# Usage

- Clone the repo
- Navigate to the directory
- Run the following
```
$ bundle install
$ irb
> require './lib/account'
```
- To create an account with an initial balance of 0 and no overdraft:
```
> account = Account.new
```
- To create an account with an initial balance of e.g. £50 and no overdraft:
```
> account = Account.new(50)
```
- To create an account with an initial balance of e.g. £50 and an overdraft of e.g. £50:
```
> account = Account.new(50, 50)
```
- To make a deposit or withdrawal:
```
> account.deposit(100)
> account.withdrawal(100)
```
- To view your bank statement:
```
> account.print_statement
```

# Example
```
3.0.0 :001 > require './lib/account'
 => true 
3.0.0 :002 > account = Account.new
 => #<Account:0x0000000138060958 @balance=0, @overdraft=0, @statement=#<Statement:0x0000000138060750 @transaction_list=[]>> 
3.0.0 :003 > account.deposit(1000)
 => [#<Transaction:0x000000014e299b28 @balance=1000, @credit=1000, @date="22/02/2022">] 
3.0.0 :004 > account.deposit(2000)
 => 
[#<Transaction:0x000000014e299b28 @balance=1000, @credit=1000, @date="22/02/2022">,
 #<Transaction:0x000000014e1b0518 @balance=3000, @credit=2000, @date="22/02/2022">] 
3.0.0 :005 > account.withdrawal(500)
 => 
[#<Transaction:0x000000014e299b28 @balance=1000, @credit=1000, @date="22/02/2022">,
 #<Transaction:0x000000014e1b0518 @balance=3000, @credit=2000, @date="22/02/2022">,
 #<Transaction:0x000000014e14b000 @balance=2500, @date="22/02/2022", @debit=500>] 
3.0.0 :006 > account.print_statement
date || credit || debit || balance
22/02/2022 ||  || £500.00 || £2500.00
22/02/2022 || £2000.00 ||  || £3000.00
22/02/2022 || £1000.00 ||  || £1000.00
```

# User stories

```
User Stories
As a user
So I can put money in my account
I want to be able to make a deposit

As a user
So I can spend my money
I want to be able to make a withdrawal

As a user
So I can find out how little money I have in my account
I want to be able to see my balance

As a user
So I can keep track of my spending
I want to see the dates of my withdrawals

As a user
So I can keep track of my earnings
I want to see the dates of my deposits

As a user
So I can see everything at once
I want all the info to be in a nice little table
```

# My approach 

I began by looking at one user story at a time, creating a test for it and then getting the test to pass.
I started with the account class, and the transaction and statement classes grew as I refactored my code.
The transaction class started out with more methods, but as I refactored more and more, the class shrunk
to just the initialize method, and I'm a little worried that the class has become unnecessary.

Once I'd gotten to the point where I felt I'd reached the mvp, I made some checks for edge cases and
added a couple of extra features; the ability to create an account with an initial balance, and/or
one with an overdraft. I tried to make sure to test-drive the development of these features, as well 
as for the edge cases.

# Testing and linting

The app has been built using TDD, and I've tried to be thorough with my tests.
Simplecov is recording 100% coverage and rubocop is reporting one error:
```
C: Metrics/BlockLength: Block has too many lines. [66/25]
describe Account do ...
```
To check tests, coverage, and linting, run the following
```
$ rspec
$ rubocop
```
