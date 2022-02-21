module StatementHelpers
  def display_formatter(info)
    info.join(' || ')
  end

  def monetiser(amount)
    decimal_amount = format('%.2f', amount)
    "£#{decimal_amount}"
  end
end
