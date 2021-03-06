# define my_account and told Cucumber to put it into the world
#module KnowsTheDomain

class UserInterface
	include Capybara::DSL
	def withdraw_from(account, amount)
		Sinatra::Application.account = account
		visit '/'
		fill_in 'Amount', :with => amount
		click_button 'Withdraw'
	end
end

module KnowsTheUserInterface
	def my_account
		@my_account ||= Account.create!(:number => "test", :balance => 0)
	end
	def cash_slot
		#@cash_slot ||= CashSlot.new
		Sinatra::Application.cash_slot
	end
	def teller
		#@teller ||= Teller.new(cash_slot)
		@teller ||= UserInterface.new
	end
end
#World(KnowsTheDomain)
World(KnowsTheUserInterface)