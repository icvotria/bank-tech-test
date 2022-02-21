class Statement
  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def add_transaction(transaction)
    @transaction_list << transaction
  end
end
