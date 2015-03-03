require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

Before do
	DatabaseCleaner.clean
end

#After do
	#DatabaseCleaner.clean
#end