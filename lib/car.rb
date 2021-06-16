class Car
  attr_reader :type, :weight

  def initialize(attributes)
    @type = attributes[:type]
    @weight = attributes[:weight]
  end
  
end
