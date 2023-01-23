class Statement
  def initialize(transaction_history)
    @transactions = transaction_history
  end

  attr_reader :transactions

  def format_for_printing
    transactions.map do |transaction|
      if transaction.type == 'deposit'
        "#{transaction.date} || #{sprintf("%.2f", transaction.amount)} || || #{sprintf("%.2f", transaction.balance)}"
      else
        "#{transaction.date} || || #{sprintf("%.2f", transaction.amount)} || #{sprintf("%.2f", transaction.balance)}"
      end
    end
  end
end