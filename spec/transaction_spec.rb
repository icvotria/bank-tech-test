require 'transaction'

describe Transaction do
  let(:transaction) { Transaction.new(100, 100) }

  it 'records the date of the transaction' do
    expect(transaction.date).to eq Date.today.strftime('%d/%m/%Y')
  end
end
