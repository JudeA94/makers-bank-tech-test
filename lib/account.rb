class Account
  def initialize(name, sort_code, account_number)
    @name = name
    @sort_code = sort_code
    @account_number = account_number
  end

  attr_reader :account_number, :sort_code
  attr_accessor :name

end