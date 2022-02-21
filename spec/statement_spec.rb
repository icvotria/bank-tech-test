require 'statement'

describe Statement do
  let(:statement) { Statement.new }

  before(:each) do
    transaction1 = double('transaction')
    transaction2 = double('transaction')

    allow(transaction1).to receive(:amount) { 50 }
    allow(transaction1).to receive(:date) { '20/02/2022' }
    allow(transaction1).to receive(:type) { 'debit' }
    allow(transaction1).to receive(:balance) { 50 }

    allow(transaction2).to receive(:amount) { 100 }
    allow(transaction2).to receive(:date) { '21/02/2022' }
    allow(transaction2).to receive(:type) { 'credit' }
    allow(transaction2).to receive(:balance) { 150 }

    statement.add_transaction(transaction1)
    statement.add_transaction(transaction2)
  end

  it 'can return an array of transactions' do
    expect(statement.transaction_list.length).to eq 2
    expect(statement.transaction_list[0].type).to eq 'debit'
    expect(statement.transaction_list[-1].type).to eq 'credit'
    expect(statement.transaction_list[0].balance).to eq 50
    expect(statement.transaction_list[-1].balance).to eq 150
  end

  it 'displays transactions in a nice little form' do
    expect { statement.display }.to output('date || credit || debit || balance
20/02/2022 || || £50 || £50
21/02/2022 || £100 || || £150
').to_stdout
  end
end
