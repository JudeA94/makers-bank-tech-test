class Account
  def initialize(name, sort_code, account_number)
    @name = name
    @sort_code = sort_code
    @account_number = account_number
    @balance = 0
    @transaction_history = []
  end

  attr_reader :balance, :transaction_history

  def details
    { name: @name, sort_code: @sort_code, account_number: @account_number }
  end


end