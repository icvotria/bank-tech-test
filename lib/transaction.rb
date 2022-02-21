require 'date'

class Transaction
  attr_reader :date, :type, :amount

  def initialize(amount)
    @date = Date.today
    @amount = amount
    @type = transaction_type
  end

  private

  def transaction_type
    @amount.to_i.positive? ? 'credit' : 'debit'
  end
end
