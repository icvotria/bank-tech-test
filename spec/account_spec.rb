require 'account'
require_relative 'test_helper'

describe Account do
  let(:account) { Account.new }
  let(:account_with_initial_balance) { Account.new(50) }
  let(:account_with_overdraft) { Account.new(0, 50) }

  describe '#deposit' do
    it 'accepts deposits' do
      account.deposit(100)

      expect(account.balance).to eq 100
    end

    it 'doesn\'t let user deposit negative amount' do
      expect { account.deposit(-100) }
        .to output("Amount must be greater than zero\n").to_stdout
    end

    it 'doesn\'t let user deposit zero' do
      expect { account.deposit(0) }
        .to output("Amount must be greater than zero\n").to_stdout
    end
  end

  describe '#withdrawal' do
    it 'accepts withdrawals' do
      account.deposit(100)
      account.withdrawal(50)

      expect(account.balance).to eq(50)
    end

    it 'doesn\'t let user deposit negative amount' do
      expect { account.withdrawal(-50) }
        .to output("Amount must be greater than zero\n").to_stdout
    end

    it 'doesn\'t let user withdraw zero' do
      expect { account.withdrawal(0) }
        .to output("Amount must be greater than zero\n").to_stdout
    end

    it 'doesn\'t let balance fall below overdraft limit' do
      expect { account.withdrawal(50) }
        .to output("You don\'t have enough funds\n").to_stdout
    end

    it 'raises error if user tries to go below overdraft limit' do
      expect { account_with_overdraft.withdrawal(100) }
        .to output("You don\'t have enough funds\n").to_stdout
    end

    it 'allows user\'s balance to go below zero if within overdraft' do
      account_with_overdraft.withdrawal(40)

      expect(account_with_overdraft.balance).to eq(-40)
    end
  end

  describe '#print_statement' do
    it 'displays transactions in a nice little form' do
      account.deposit(100)
      account.withdrawal(50)

      expect { account.print_statement }.to output("date || credit || debit || balance
#{Date.today.strftime('%d/%m/%Y')} ||  || £50.00 || £50.00
#{Date.today.strftime('%d/%m/%Y')} || £100.00 ||  || £100.00
").to_stdout
    end
  end

  describe '#initialize' do
    it 'inialises with default balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'initialises with given balance if passed an arg' do
      expect(account_with_initial_balance.balance).to eq 50
    end

    it 'inialises with default overdraft of 0' do
      expect(account.overdraft).to eq 0
    end

    it 'initialises with given overdraft if passed an arg' do
      expect(account_with_overdraft.overdraft).to eq 50
    end
  end
end
