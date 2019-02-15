require_relative 'lib/credit_card_checker'

card_number = ARGV[0]

type = CreditCardChecker.identify_type(card_number)

if type
  card_status = CreditCardChecker.check_validity(card_number)
  puts "This card is #{type}. It is #{card_status}."
else
  puts "The entered data is incorrect"
end
