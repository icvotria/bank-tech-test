module ErrorMethods
  def check_amount(amount)
    raise 'Amount must be greater than zero' unless amount.positive?
  end

  def check_funds(amount)
    raise 'You don\'t have enough funds' if (@balance + @overdraft) - amount <= 0
  end
end