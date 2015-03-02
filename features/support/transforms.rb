#Transform a string to an integer
CAPTURE_CASH_AMOUNT = Transform /^\$(\d+)$/ do |digits|
	digits.to_i
end