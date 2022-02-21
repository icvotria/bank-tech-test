require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new }

  it 'records the date of the transaction' do
    expect(transaction.date).to eq Date.today
  end
end
