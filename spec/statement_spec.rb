require 'statement'
require_relative 'test_helper'

describe Statement do
  include TestHelper

  let(:statement) { Statement.new }

  it 'adds a transaction to the statement' do
    transaction = double('transaction')
    transaction_stub(transaction, '20/02/2022', nil, 50, 50)

    expect(statement.add_transaction(transaction).length).to eq 1
  end

  it 'formats the transaction' do
    transaction1 = double('transaction')
    transaction2 = double('transaction')

    transaction_stub(transaction1, '20/02/2022', nil, 50, 50)
    transaction_stub(transaction2, '21/02/2022', 100, nil, 150)

    statement.add_transaction(transaction1)
    statement.add_transaction(transaction2)

    expect(statement.display).to eq(["21/02/2022 || £100.00 ||  || £150.00\n", "20/02/2022 ||  || £50.00 || £50.00\n"])
  end
end
