require 'statement'

describe Statement do
  context 'on construction' do
    it 'contains the transactional history of the account' do
      fake_deposit = double(:transaction, date: '23/01/2023', type: 'deposit', amount: 100)
      fake_withdrawel = double(:transaction, date: '23/01/2023', type: 'withdrawel', amount: 50)
      statement = Statement.new([fake_deposit, fake_withdrawel])
      expect(statement.transactions).to eq [fake_deposit, fake_withdrawel]
    end
  end
  context 'format_for_printing method' do
    it 'returns the transaction history in the desired format' do
      fake_deposit = double(:transaction, date: '23/01/2023', type: 'deposit', amount: 100, balance: 100)
      fake_withdrawel = double(:transaction, date: '23/01/2023', type: 'withdrawel', amount: 50, balance: 50)
      statement = Statement.new([fake_deposit, fake_withdrawel])
      expect(statement.format_for_printing).to eq ['23/01/2023 || 100.00 || || 100.00', '23/01/2023 || || 50.00 || 50.00']
    end
  end
end
