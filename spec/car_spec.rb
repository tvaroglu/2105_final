require 'simplecov'
SimpleCov.start

require_relative '../lib/car'

RSpec.describe Car do
  it 'initializes' do
    car = Car.new({type: 'Mail', weight: 5})

    expect(car.class).to eq(Car)
    expect(car.type).to eq('Mail')
    expect(car.weight).to eq(5)
  end
end
