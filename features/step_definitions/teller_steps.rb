When (/^I withdraw (#{CAPTURE_CASH_AMOUNT}) from my account$/) do |amount|
  teller.withdraw_from(my_account, amount)
  end