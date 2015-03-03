require_relative 'transaction_queue'
require_relative 'account'
#require_relative 'balance_store'

=begin
class Account
	def initialize
		@queue = TransactionQueue.new
		@balance_store = BalanceStore.new
	end
	def credit(amount)
		@queue.write("+#{amount}")
	end
	
	def balance
		@balance_store.balance
	end
	def debit(amount)
		@queue.write("-#{amount}")
	end
end
=end

# using dependency injection to pass CashSlot to Teller's constructor
class Teller
	def initialize(cash_slot)
		@cash_slot = cash_slot
	end
	def withdraw_from(account, amount)
		account.debit(amount)
		@cash_slot.dispense(amount)
	end
end

class CashSlot
	def contents
		@contents or raise ("I'm empty!")
	end
	def dispense(amount)
		@contents = amount
	end
end

require 'sinatra'
	get '/' do 
 		%{ 
	 < html >
		 < body > 
			 < form action ="/ withdraw" method =" post” >
				 < label for =" amount" > Amount </ label > 
				 < input type =" text" id =" amount" name =" amount" > 
				 < button type =" submit" > Withdraw </ button >
			 </ form >
		 </ body >
	 </ html>
}
end

post '/withdraw' do
fail "I don't know how to withraw yet, sorry"
end

set :cash_slot, CashSlot.new
post '/withdraw' do
	teller = Teller.new(settings.cash_slot)
	fail "I don't know how to withraw yet, sorry"
end

set :cash_slot, CashSlot.new
set :account do
	fail 'account has not been set'
end

post '/withdraw' do
	teller = Teller.new(settings.cash_slot)
	teller.withdraw_from(settings.account, params[:amount].to_i)
end