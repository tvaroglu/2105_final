class TrainYard
  attr_reader :location, :trains

  def initialize(attributes)
    @location = attributes[:location]
    @trains = Array.new
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.map do |train|
      train.type
    end.uniq.sort_by { |type| type }
  end

  def trains_containing(car)
    collection_arr = Array.new
    @trains.each do |train|
      train.cargo.keys.each do |train_car|
        collection_arr << train if car.type == train_car.type
      end
    end
    collection_arr.uniq
  end

  def sorted_cargo_list
    collection_arr = Array.new
    @trains.each do |train|
      train.cargo.keys.each do |train_car|
        collection_arr << train_car.type
      end
    end
    collection_arr.uniq.sort_by { |type| type }
  end

  def total_inventory
    @trains.each_with_object(Hash.new(0)) do |train, hash|
      train.cargo.each do |car, quantity|
        hash[car] += quantity
      end
    end
  end

  def overflow_cars
    collection_arr = Array.new
    filtered = total_inventory.select do |car, quantity|
      quantity > 10
    end
    @trains.each_with_index do |train, index|
      if train.cargo.keys[index].type == filtered[type]
        collection_arr << train
      end
    end
    collection_arr.uniq
  end

  def unload(car, quantity)
    # stuff
  end

end
