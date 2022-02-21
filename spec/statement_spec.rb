require 'statement'

describe Statement do
  let(:statement) { Statement.new }
  let(:transaction1) { { amount: 100, date: '2022-02-21', type: 'credit' } }
  let(:transaction2) { { amount: 50, date: '2022-02-22', type: 'debit' } }

  it 'can return an array of transactions' do
    statement.add_transaction(transaction1)
    statement.add_transaction(transaction2)

    expect(statement.transaction_list.length).to eq 2
    expect(statement.transaction_list[0][:type]).to eq 'credit'
    expect(statement.transaction_list[-1][:type]).to eq 'debit'
  end
end
