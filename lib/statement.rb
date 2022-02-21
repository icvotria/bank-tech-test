class Statement
  attr_reader :transaction_list

  def initialize
    @transaction_list = []
  end

  def add_transaction(transaction)
    @transaction_list << transaction
  end

  def display
    puts 'date || credit || debit || balance'
    @transaction_list.each do |transaction|
      if transaction.type == 'credit'
        puts "#{transaction.date} || £#{transaction.amount} || || £#{transaction.balance}"
      else
        puts "#{transaction.date} || || £#{transaction.amount.abs} || £#{transaction.balance}"
      end
    end
  end
end
