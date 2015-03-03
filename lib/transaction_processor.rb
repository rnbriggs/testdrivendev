require_relative 'transaction_queue'
require_relative 'account'
#require_relative 'balance_store'

transaction_queue = TransactionQueue.new
#balance_store = BalanceStore.new

puts "transaction processor ready"

loop do
	transaction_queue.read do |message|
		sleep 1
		transaction_amount, number = message.split(/,/)
		account = Account.find_by_number!
		(number.strip)
		new_balance = account.balance + 
		transaction_amount.to_i
		account.balance = new_balance
		account.save
	end
end
		