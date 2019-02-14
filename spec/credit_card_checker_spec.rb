require 'credit_card_checker'

RSpec.describe CreditCardChecker do
  let(:cards) { %w(4417123456789112
                   371234567890123
                   6011123456789012
                   5412345678901234
                   639002629001853224) }

  describe '.identify_type' do
    let(:types) { cards.map { |card_number| CreditCardChecker.identify_type(card_number) } }

    it 'should correctly identify card type' do
      expect(types).to eq %w(Visa AMEX Discover MasterCard unknown)
    end
  end

  describe '.check_validity' do
    context 'card is valid' do
      it 'it should issue that the card is valid' do
        expect(CreditCardChecker.check_validity(cards.last)).to eq 'valid'
      end
    end

    context 'card is not valid' do
      it 'it should issue that the card is not valid' do
        expect(CreditCardChecker.check_validity(cards.first)).to eq 'not valid'
      end
    end
  end
end
