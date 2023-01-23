require 'bank'

describe Bank do
  context 'On construction' do
    it 'stores a valid sort code' do
      bank = Bank.new('11-22-33')
      expect(bank.sort_code).to eq '11-22-33'
    end
  end
end