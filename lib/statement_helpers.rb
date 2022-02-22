module StatementHelpers
  def display_formatter(info)
    info.join(' || ')
  end

  def monetiser(amount)
    if amount.nil?
      nil
    else
      decimal_amount = format('%.2f', amount)
      "£#{decimal_amount}"
    end
  end

  def transaction_list_formatter
    @transaction_list.map do |transaction|
      [transaction.date,
       monetiser(transaction.credit),
       monetiser(transaction.debit),
       monetiser(transaction.balance)]
    end
  end
end
