require 'simplecov'
SimpleCov.start

require_relative '../lib/car'
require_relative '../lib/train'
require_relative '../lib/train_yard'

RSpec.describe TrainYard do

  it 'initializes' do
    train_yard = TrainYard.new({location: 'Brighton'})

    expect(train_yard.class).to eq(TrainYard)
    expect(train_yard.location).to eq('Brighton')
    expect(train_yard.trains).to eq([])
  end

  it 'can add trains' do
    train_yard = TrainYard.new({location: 'Brighton'})

    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})
    car3 = Car.new({type: 'Cattle', weight: 3})
    car4 = Car.new({type: 'Dining', weight: 4})

    train1 = Train.new({name: 'Thomas', type: 'Tank'})
    train2 = Train.new({name: 'Emily', type: 'Tender'})
    train3 = Train.new({name: 'Nia', type: 'Tank'})
    train4 = Train.new({name: 'Gordon', type: 'Express'})

    train1.add_cars(car1, 5)
    train1.add_cars(car2, 2)

    train2.add_cars(car1, 3)
    train2.add_cars(car4, 4)

    train3.add_cars(car1, 1)

    train4.add_cars(car4, 5)
    train4.add_cars(car3, 10)

    train_yard.add_train(train1)
    train_yard.add_train(train2)
    train_yard.add_train(train3)
    train_yard.add_train(train4)

    expected = train_yard.trains
    expect(expected.class).to eq(Array)
    expect(expected.length).to eq(4)
    expect(expected[0]).to eq(train1)
    expect(expected[1]).to eq(train2)
    expect(expected[2]).to eq(train3)
    expect(expected[3]).to eq(train4)

    expected = train_yard.types_of_trains
    expect(expected.class).to eq(Array)
    expect(expected.length).to eq(3)
    # => ['Express', 'Tank', 'Tender']
    expect(expected[0]).to eq(train4.type)
    expect(expected[1]).to eq(train1.type)
    expect(expected[2]).to eq(train2.type)

    expected = train_yard.trains_containing(car1)
    expect(expected.class).to eq(Array)
    expect(expected.length).to eq(3)
    # In this example, it's Thomas, Emily and Nia
    expect(expected.index(train1)).not_to eq(nil)
    expect(expected.index(train2)).not_to eq(nil)
    expect(expected.index(train3)).not_to eq(nil)
  end

  it 'can analyze inventory' do
    train_yard = TrainYard.new({location: 'Brighton'})

    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})
    car3 = Car.new({type: 'Cattle', weight: 3})
    car4 = Car.new({type: 'Dining', weight: 4})

    train1 = Train.new({name: 'Thomas', type: 'Tank'})
    train2 = Train.new({name: 'Emily', type: 'Tender'})
    train3 = Train.new({name: 'Nia', type: 'Tank'})
    train4 = Train.new({name: 'Gordon', type: 'Express'})

    train1.add_cars(car1, 5)

    train2.add_cars(car1, 3)
    train2.add_cars(car4, 4)

    train3.add_cars(car1, 4)

    train4.add_cars(car4, 5)
    train4.add_cars(car3, 10)

    train_yard.add_train(train1)
    train_yard.add_train(train2)
    train_yard.add_train(train3)
    train_yard.add_train(train4)

    expected = train_yard.sorted_cargo_list
    expect(expected.class).to eq(Array)
    expect(expected.length).to eq(3)
    # => ['Cattle', 'Dining', 'Mail']
    expect(expected[0]).to eq(car3.type)
    expect(expected[1]).to eq(car4.type)
    expect(expected[2]).to eq(car1.type)

    expected = train_yard.total_inventory
    expect(expected.class).to eq(Hash)
    expect(expected.keys.length).to eq(3)
    expect(expected.values.length).to eq(3)
    # => {
      #<Car:0x87123ffe...> => 12,
      #<Car:0x007f9c562a5f18...>  => 10,
      #<Car:0x007f9c56343038...> => 9}
    expect(expected[car1]).to eq(12)
    expect(expected[car4]).to eq(9)
    expect(expected[car3]).to eq(10)


    expected = train_yard.overflow_cars
    expect(expected.class).to eq(Array)
    expect(expected.length).to eq(1)
    # => [#<Car:0x87123ffe...>]
    expect(expected.first).to eq(car1)
  end

  it 'can unload cargo' do
    train_yard = TrainYard.new({location: 'Brighton'})

    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})
    car3 = Car.new({type: 'Cattle', weight: 3})
    car4 = Car.new({type: 'Dining', weight: 4})

    train1 = Train.new({name: 'Thomas', type: 'Tank'})
    train2 = Train.new({name: 'Emily', type: 'Tender'})
    train3 = Train.new({name: 'Nia', type: 'Tank'})
    train4 = Train.new({name: 'Gordon', type: 'Express'})

    train1.add_cars(car1, 5)

    train2.add_cars(car1, 3)
    train2.add_cars(car4, 4)

    train3.add_cars(car1, 4)

    train4.add_cars(car4, 5)
    train4.add_cars(car3, 10)

    train_yard.add_train(train1)
    train_yard.add_train(train2)
    train_yard.add_train(train3)
    train_yard.add_train(train4)

    expect(train_yard.unload(car3, 100)).to eq(false)
    expect(train_yard.unload(car1, 7)).to eq(true)

    expect(train1.count_cars(car1)).to eq(0)
    expect(train2.count_cars(car1)).to eq(1)
  end

end
