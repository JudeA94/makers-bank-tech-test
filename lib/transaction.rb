require 'date'

class Transaction
  def initialize(type, amount)
    @date = DateTime.now.strftime('%m/%d/%Y')
    @type = type
    @amount = amount
  end

  attr_reader :date, :type, :amount
end
