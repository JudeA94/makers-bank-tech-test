require 'bank'

describe Bank do
  context 'On construction' do
    it 'stores a valid sort code' do
      bank = Bank.new('11-22-33')
      expect(bank.sort_code).to eq '11-22-33'
    end
    it 'initializes with an empty array of accounts' do
      bank = Bank.new('11-22-33')
      expect(bank.accounts).to eq []
    end
  end

  context 'open_account method' do
    it 'adds an account to the accounts list' do
      bank = Bank.new('11-22-33')
      bank.create_account('Test Name')
      expect(bank.accounts.length).to eq 1
    end
    it 'the account has an account number and owner name' do
      bank = Bank.new('11-22-33')
      bank.create_account('Test Name')
      expect(bank.accounts[0][:name]).to eq 'Test Name'
      expect(bank.accounts[0][:account_number]).to be_a(Integer)
    end
  end

  context 'delete_account method' do
    it 'removes an account to the accounts list' do
      bank = Bank.new('11-22-33')
      bank.create_account('Test Name')
      expect(bank.accounts.length).to eq 1
      acc_number = bank.accounts[0][:account_number]
      bank.remove_account(acc_number)
      expect(bank.accounts.length).to eq 0
    end
    it "throws an error if the account doesn't exist" do
      bank = Bank.new('11-22-33')
      bank.create_account('Test Name')
      expect(bank.accounts.length).to eq 1
      acc_number = bank.accounts[0][:account_number]
      expect { bank.remove_account(acc_number + 1) }.to raise_error "That account doesn't exist"
      expect(bank.accounts.length).to eq 1
    end
  end

end