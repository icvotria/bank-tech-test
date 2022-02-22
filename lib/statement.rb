require_relative 'statement_helpers'

class Statement
  include StatementHelpers

  attr_reader :transaction_list, :formatted_transactions

  def initialize
    @transaction_list = []
    @formatted_transactions = []
  end

  def add_transaction(transaction)
    @transaction_list << transaction
  end

  def display
    transaction_list_formatter
    puts display_formatter(%w[date credit debit balance])
    @formatted_transactions.reverse.each do |transaction|
      puts display_formatter(transaction)
    end
    @formatted_transactions = []
  end
end
