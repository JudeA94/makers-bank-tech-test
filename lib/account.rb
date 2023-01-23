require 'transaction'
require 'statement'

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

  def deposit(amount)
    @balance += amount
    deposit = Transaction.new('deposit', amount, @balance)
    @transaction_history.push(deposit)
    deposit
  end

  def withdraw(amount)
    raise 'Insufficient funds' if amount > @balance
    @balance -= amount
    withdrawel = Transaction.new('withdrawel', amount, @balance)
    @transaction_history.push(withdrawel)
    withdrawel
  end

  def print_statement
    statement = Statement.new(@transaction_history, Kernel)
    statement.print
  end
end