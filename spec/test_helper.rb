module TestHelper
  def transaction_stub(transaction, date, credit, debit, balance)
    allow(transaction).to receive(:date) { date }
    allow(transaction).to receive(:credit) { credit }
    allow(transaction).to receive(:debit) { debit }
    allow(transaction).to receive(:balance) { balance }
  end
end
