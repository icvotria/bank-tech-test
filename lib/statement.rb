require_relative 'statement_helpers'

class Statement
  include StatementHelpers

  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def add_transaction(transaction)
    @transaction_list << transaction
  end

  def display
    puts display_formatter(['date', 'credit', 'debit', 'balance'])
    @transaction_list.each do |transaction|
      if transaction.type == 'credit'
        puts display_formatter([transaction.date, monetiser(transaction.amount), nil, monetiser(transaction.balance)])
      else
        puts display_formatter([[transaction.date, nil, monetiser(transaction.amount.abs), monetiser(transaction.balance)]])
      end
    end
  end
end
