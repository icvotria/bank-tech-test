require 'account'
require_relative 'test_helper'

describe Account do
  let(:account) { Account.new }

  it 'accepts deposits' do
    account.deposit(100)

    expect(account.balance).to eq 100
  end

  it 'accepts withdrawals' do
    account.withdrawal(50)

    expect(account.balance).to eq(-50)
  end

  it 'displays transactions in a nice little form' do
    statement = instance_double(Statement)
    account.deposit(100)
    account.withdrawal(50)
  
    expect { account.print_statement }.to output("date || credit || debit || balance
#{Date.today.strftime('%d/%m/%Y')} ||  || £50.00 || £50.00
#{Date.today.strftime('%d/%m/%Y')} || £100.00 ||  || £100.00
").to_stdout
  end
end
