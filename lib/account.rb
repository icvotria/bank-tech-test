require_relative 'transaction'

class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount.to_i
    transaction = Transaction.new(amount)
  end

  def withdrawal(amount)
    @balance -= amount.to_i
    transaction = Transaction.new(-amount)
  end
end
