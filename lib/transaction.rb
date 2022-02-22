require 'date'

class Transaction
  attr_reader :date, :credit, :debit, :balance

  def initialize(amount, balance)
    @date = Date.today.strftime('%d/%m/%Y')
    @balance = balance
    amount.positive? ? @credit = amount : @debit = amount.abs
  end
end
