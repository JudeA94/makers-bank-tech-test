require 'transaction'
require 'date'

describe Transaction do
  context 'on construction' do
    it 'has a type, amount and date' do
      deposit = Transaction.new('deposit', 100)
      current_date = DateTime.now.strftime('%m/%d/%Y')
      expect(deposit.type).to eq 'deposit'
      expect(deposit.amount).to eq 100
      expect(deposit.date).to eq current_date

    end
  end
end