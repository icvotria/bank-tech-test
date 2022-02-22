require_relative 'statement_helpers'

class Statement
  include StatementHelpers

  def initialize
    @transaction_list = []
  end

  def add_transaction(transaction)
    @transaction_list << transaction
  end

  def display
    formatted_transactions = transaction_list_formatter
    formatted_transactions.reverse.map do |transaction|
      "#{display_formatter(transaction)}\n"
    end
  end
end
