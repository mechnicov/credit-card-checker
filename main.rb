require_relative 'lib/credit_card'
require_relative 'lib/credit_card_checker'

card_number = ARGV[0]
credit_card = CreditCard.new(card_number)
credit_card_checker = CreditCardChecker.new(credit_card)
p credit_card_checker.check_type
p credit_card_checker.check_validity
