require 'statement'
require_relative 'test_helper'

describe Statement do
  include TestHelper

  let(:statement) { Statement.new }

  before(:each) do
    transaction1 = double('transaction')
    transaction2 = double('transaction')

    transaction_stub(transaction1, '20/02/2022', nil, 50, 50)
    transaction_stub(transaction2, '21/02/2022', 100, nil, 150)

    statement.add_transaction(transaction1)
    statement.add_transaction(transaction2)
  end

  it 'can return an array of transactions' do
    expect(statement.transaction_list.length).to eq 2
    expect(statement.transaction_list[0].credit).to eq nil
    expect(statement.transaction_list[0].debit).to eq 50
    expect(statement.transaction_list[-1].credit).to eq 100
    expect(statement.transaction_list[-1].debit).to eq nil
    expect(statement.transaction_list[0].balance).to eq 50
    expect(statement.transaction_list[-1].balance).to eq 150
  end

  it 'displays transactions in a nice little form' do
    expect { statement.display }.to output('date || credit || debit || balance
21/02/2022 || £100.00 ||  || £150.00
20/02/2022 ||  || £50.00 || £50.00
').to_stdout
  end
end
