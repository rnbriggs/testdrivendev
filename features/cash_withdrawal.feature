Feature: Cash Withdrawal
	Scenario: Successful withdrawal from an account in credit
		Given that $100 is credited to my account
		When I withdraw $20 from my account
		Then the $20 should be dispensed
		And the balance of my account should be $80 cash