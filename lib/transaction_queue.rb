require 'fileutils'

#used to ensure the queue is cleaned between scenarios
class TransactionQueue
	def self.clear
		FileUtils.rm_rf('messages')
		FileUtils.mkdir_p('messages')
	end
	# create instance variable to give each new message a unique filename
	def initialize
		@next_id = 1
	end
	# when asked to write a message, create a new file in the messages directory, write the contents into the file and increment @next_id ready for naming the next message's file
	def write(transaction)
		File.open("messages/#{@next_id}",
			'w') { |f| f.puts(transaction)}
			@next_id += 1
	end
	
	def read
		next_message_file = 
		Dir['messages/*'].first
		return unless next_message_file
		yield File.read(next_message_file)
		FileUtils.rm_rf(next_message_file)
		end
end