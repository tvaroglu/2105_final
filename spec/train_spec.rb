require 'simplecov'
SimpleCov.start

require_relative '../lib/car'
require_relative '../lib/train'

RSpec.describe Train do

  it 'initializes' do
    train = Train.new({name: 'Thomas', type: 'Tank'})

    expect(train.class).to eq(Train)
    expect(train.name).to eq('Thomas')
    expect(train.type).to eq('Tank')
    expect(train.cargo).to eq({})
  end

  it 'can add and count cars' do
    train = Train.new({name: 'Thomas', type: 'Tank'})
    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})

    expect(train.count_cars(car1)).to eq(0)

    train.add_cars(car1, 2)

    expect(train.cargo.keys.first).to eq(car1)
    expect(train.cargo.values.first).to eq(2)
    expect(train.count_cars(car1)).to eq(2)

    train.add_cars(car1, 3)

    expect(train.cargo.keys.first).to eq(car1)
    expect(train.cargo.values.first).to eq(5)
    expect(train.count_cars(car1)).to eq(5)

    train.add_cars(car2, 10)
    expect(train.cargo[car1]).to eq(5)
    expect(train.cargo[car2]).to eq(10)
  end

  it 'can calculate total weight' do
    train = Train.new({name: 'Thomas', type: 'Tank'})
    car1 = Car.new({type: 'Mail', weight: 5})
    car2 = Car.new({type: 'Passengers', weight: 1})

    train.add_cars(car1, 5)
    train.add_cars(car2, 2)

    expect(train.weight).to eq(27)
  end

  it 'can remove cars' do
    train = Train.new({name: 'Thomas', type: 'Tank'})
    car = Car.new({type: 'Mail', weight: 5})

    train.add_cars(car, 5)

    train.remove_cars(car, 5)

    expect(train.cargo).to eq({})
  end

end
