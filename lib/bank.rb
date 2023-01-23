class Bank
  def initialize(sort_code)
    @sort_code = sort_code
  end

  attr_reader :sort_code
end
