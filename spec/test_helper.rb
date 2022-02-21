module TestHelper
  def transaction_stub(transaction, amount, date, type, balance)
    allow(transaction).to receive(:amount) { amount }
    allow(transaction).to receive(:date) { date }
    allow(transaction).to receive(:type) { type }
    allow(transaction).to receive(:balance) { balance }
  end
end