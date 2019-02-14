module CreditCardChecker
  def self.check_type(card_number)
    case card_number
    when /\A(34|37)\d{13}\z/ then 'AMEX'
    when /\A6011\d{12}\z/ then 'Discover'
    when /\A5[1-5]\d{14}\z/ then 'MasterCard'
    when /\A4(\d{12}|\d{15})\z/ then 'Visa'
    else 'unknown'
    end
  end

  def self.check_validity(card_number)
    sum = 0
    card_number.reverse.split('').map(&:to_i).each.with_index(1) do |d, i|
      d *= 2 if i.even?
      d -= 9 if d > 9
      sum += d
    end
    (sum % 10).zero? ? 'valid' : 'not valid'
  end
end
