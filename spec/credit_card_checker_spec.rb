require 'credit_card_checker'

RSpec.describe CreditCardChecker do
  describe '.identify_type' do
    context 'input is correct' do
      let(:cards) { %w(371234567890123
                       6011123456789012
                       5412345678901234
                       4417123456789112
                       1234567890123456) }
      it 'should correctly identify card type' do
        types = cards.map { |card_number| CreditCardChecker.identify_type(card_number) }
        expect(types).to eq %w(AMEX Discover MasterCard Visa unknown)
      end
    end

    context 'input is incorrect' do
      let(:incorrect) { 'jfkdmvpie;w' }
      it 'should return nil' do
        expect(CreditCardChecker.identify_type(incorrect)).to be_nil
      end
    end
  end

  describe '.check_validity' do
    context 'card is valid' do
      let(:valid_card) { '4408041234567893' }
      it 'should issue that the card is valid' do
        expect(CreditCardChecker.check_validity(valid_card)).to eq 'valid'
      end
    end

    context 'card is not valid' do
      let(:invalid_card) { '4417123456789112' }
      it 'should issue that the card is not valid' do
        expect(CreditCardChecker.check_validity(invalid_card)).to eq 'not valid'
      end
    end
  end
end
