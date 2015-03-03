Given(/^that (#{CAPTURE_CASH_AMOUNT}) is credited to my account$/) do |amount|
  my_account.credit(amount)
end


Then (/^the balance of my account should be (#{CAPTURE_CASH_AMOUNT}) cash$/) do |amount| 
	
	eventually {
		my_account.reload.balance.should
		eq(amount)
		}
end





#sleep 1
	#my_account.balance.should eq(amount), 
	#"Expected the balance to be #{amount} but it was #{my_account.balance}" 
