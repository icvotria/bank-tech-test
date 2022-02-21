require 'date'

class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(amount, balance)
    @date = Date.today.strftime('%d/%m/%Y')
    @amount = amount
    @type = transaction_type
    @balance = balance
  end

  private

  def transaction_type
    @amount.to_i.positive? ? 'credit' : 'debit'
  end
end
