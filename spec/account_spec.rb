require 'account'

describe Account do
  context 'on construction' do
    it 'has a balance f 0 and an empty transaction history' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      expect(account.balance).to eq 0
      expect(account.transaction_history).to eq []
    end
  end
  context 'details method' do
    it 'returns the sort-code, account number,  and name' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      expect(account.details[:name]).to eq('Test Name')
      expect(account.details[:sort_code]).to eq('11-22-33')
      expect(account.details[:account_number]).to eq('12345678')    end
  end
  context 'transaction history method' do

  end
  
end
