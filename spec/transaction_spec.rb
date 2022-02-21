require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(100) }

  it 'records the date of the transaction' do
    expect(transaction.date).to eq Date.today
  end

  it 'records the type of transaction' do
    expect(transaction.type).to eq 'credit'
  end
end
