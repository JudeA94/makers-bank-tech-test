class Bank
  def initialize(sort_code)
    @sort_code = sort_code
    @accounts = []
  end

  attr_reader :sort_code
  attr_accessor :accounts

  def create_account(name)
    @accounts.push({ name: name, sort_code: @sort_code, account_number: 12_345_678 })
  end

  def remove_account(account_number)
    raise "That account doesn't exist" if @accounts.none? { |account| account[:account_number] === account_number }
    @accounts.delete_if { |account| account[:account_number] === account_number }
  end
end
