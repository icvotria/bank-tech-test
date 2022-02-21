require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance

  def initialize
    @statement = Statement.new
    @balance = 0
  end

  def deposit(amount)
    @balance += amount.to_i
    add_to_statement(amount)
  end

  def withdrawal(amount)
    @balance -= amount.to_i
    add_to_statement(-amount)
  end

  private

  def add_to_statement(amount)
    transaction = Transaction.new(amount)
    @statement.add_transaction(transaction)
  end
end
