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
      expect(account.details[:account_number]).to eq('12345678')
    end
  end

  context 'deposit method' do
    it 'increases the balance ' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      expect(account.balance).to eq 100
    end
    it 'adds a transaction to the history' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      expect(account.transaction_history.length).to eq 1
    end
  end

  context 'withdraw method' do
    it 'throws an error if the balance is too low' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      expect { account.withdraw(50) }.to raise_error 'Insufficient funds'
      expect(account.transaction_history.length).to eq 0
    end
    it 'decreases the balance if enough funds in account' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      account.withdraw(50)
      expect(account.balance).to eq 50
    end
    it 'adds a transaction to the history if succesful' do
      account = Account.new('Test Name', '11-22-33', '12345678')
      account.deposit(100)
      account.withdraw(50)
      expect(account.transaction_history.length).to eq 2
    end
  end
end
