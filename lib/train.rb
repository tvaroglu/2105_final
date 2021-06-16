class Train
  attr_reader :name, :type, :cargo

  def initialize(attributes)
    @name = attributes[:name]
    @type = attributes[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, quantity)
    @cargo[car] += quantity
  end

  def remove_cars(car, quantity)
    @cargo[car] -= quantity
    if @cargo[car] <= 0
      @cargo.delete(car)
    end
  end

  def weight
    @cargo.sum do |car, quantity|
      car.weight * quantity
    end
  end

end
