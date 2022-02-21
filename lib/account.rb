require_relative 'transaction'
require_relative 'statement'

class Account
  attr_reader :balance, :statement

  def initialize
    @statement = Statement.new
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
    add_to_statement(amount)
  end

  def withdrawal(amount)
    @balance -= amount
    add_to_statement(-amount)
  end

  def print_statement
    @statement.display
  end

  private

  def add_to_statement(amount)
    transaction = Transaction.new(amount, @balance)
    @statement.add_transaction(transaction)
  end
end
