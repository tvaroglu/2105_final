# Choo Choo Train

## Instructions
* Fork this repository
* Clone your forked repo to your computer
* Complete the activity below
* Push your solution to yhour forked repository
* Submit a pull request from your repository to this repository - PUT YOUR NAME IN YOUR PR!
* Do not pay attention to the particular object IDs that are returned, their purpose
is to only demonstrate that we are getting objects back, and do not denote a particular
sequence or uniqueness of objects.

### Iteration 1 - Cars and Trains

For `#add_cars`, the first argument is a car object, the second is the number of cars.

For `#cargo` the keys are the car object, and the value is the number of cars.

It may be helpful to think of a `Car` as a type of train car and not necessarily an individual a car.

Use TDD to build a `Car` and a `Train` class that respond to the interaction pattern below:

```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/train'
# => true

pry(main)> car1 = Car.new({type: 'Mail', weight: 5})
# => #<Car:0x87123ffe...>

pry(main)> car1.type
# => 'Mail'

pry(main)> car1.weight
# => 5

pry(main)> car2 = Car.new({type: 'Passengers', weight: 1})
# => #<Car:0x8711233abc...>

pry(main)> train1 = Train.new({name: 'Thomas', type: 'Tank'})
# => #<Train:0x007fd8858863b8...>

pry(main)> train1.name
# => 'Thomas'

pry(main)> train1.type
# => 'Tank'

pry(main)> train1.cargo
# => {}

pry(main)> train1.count_cars(car1)
# => 0

pry(main)> train1.add_cars(car1, 2)

pry(main)> train1.cargo
# => {#<Car:0x87123ffe...> => 2}

pry(main)> train1.count_cars(car1)
# => 2

pry(main)> train1.add_cars(car1, 3)

pry(main)> train1.cargo
# => {#<Car:0x87123ffe...> => 5}

pry(main)> train1.count_cars(car1)
# => 5

pry(main)> train1.add_cars(car2, 10)

pry(main)> train1.cargo
# => {#<Car:0x87123ffe...> => 5, #<Car:0x8711233abc...> => 10}
```

### Iteration 2 - Train Yards and Trains

A Train will be able to calculate its weight. We can assume this to be the sum of all their cars * weight.

A TrainYard is responsible for keeping track of Trains. It should have a method called `types_of_trains` that returns an array
of unique train types in alphabetical order.

A TrainYard will also have a method called `trains_containing` that takes an argument of a car. It will return
an array of Train objects that have the kind of car.

Use TDD to create a TrainYard class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/train'
# => true

pry(main)> require './lib/train_yard'
# => true

pry(main)> train_yard = TrainYard.new({location: 'Brighton'})
# => #<TrainYarR:0x00007fe134933e20...>

pry(main)> car1 = Car.new({type: 'Mail', weight: 5})
# => #<Car:0x87123ffe...>

pry(main)> car2 = Car.new({type: 'Passengers', weight: 1})
# => #<Car:0x8711233abc...>

pry(main)> car3 = Car.new({type: 'Cattle', weight: 3})
# => #<Car:0x007f9c562a5f18...>

pry(main)> car4 = Car.new({type: 'Dining', weight: 4})
# => #<Car:0x007f9c56343038...>

pry(main)> train1 = Train.new({name: 'Thomas', type: 'Tank'})
# => #<Train:0x007fd8858863b8...>

pry(main)> train2 = Train.new({name: 'Emily', type: 'Tender'})
#=> #<Train:0x00007fe1349bed40...>

pry(main)> train3 = Train.new({name: 'Nia', type: 'Tank'})
#=> #<Train:0x00007fe134910650...>

pry(main)> train4 = Train.new({name: 'Gordon', type: 'Express'})
#=> #<FoodTruck:0x00007fe1348a1160...>

pry(main)> train1.add_cars(car1, 5)
pry(main)> train1.add_cars(car2, 2)

pry(main)> train2.add_cars(car1, 3)
pry(main)> train2.add_cars(car4, 4)

pry(main)> train3.add_cars(car1, 1)

pry(main)> train4.add_cars(car4, 5)
pry(main)> train4.add_cars(car3, 10)

pry(main)> train_yard.add_train(train1)
pry(main)> train_yard.add_train(train2)
pry(main)> train_yard.add_train(train3)
pry(main)> train_yard.add_train(train4)

pry(main)> train_yard.trains
# => [#<Train:0x007fd8858863b8...>,#<Train:0x00007fe1349bed40...>,
#<Train:0x00007fe134910650...>, #<FoodTruck:0x00007fe1348a1160...>]

pry(main)> train1.weight
# => 27

pry(main)> train_yard.types_of_trains
# => ['Express', 'Tank', 'Tender']

pry(main) train_yard.trains_containing(car1)
# => [#<Train:0x007fd8858863b8...>,#<Train:0x00007fe1349bed40...>,
#<Train:0x00007fe134910650...>]

# In this example, it's Thomas, Emily and Nia
```

### Iteration 3 - Cargo at the Train Yard

Add a method to your TrainYard called `sorted_cargo_list` that returns a list of all
the types of cargo at the TrainYard in alphabetical order. This list should only contain
unique items.

Your TrainYard class should have a method called `total_inventory` that reports the quantities of all cars.
Specifically, it should return a hash with cars as keys and the value is the number of cars of that type
in the TrainYard.

Your TrainYard will also be able to identify `overflow_cars` A car is overflowing if it is carried by more
than one train and there are more than ten cars.

```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/train'
# => true

pry(main)> require './lib/train_yard'
# => true

pry(main)> train_yard = TrainYard.new({location: 'Brighton'})
# => #<TrainYarR:0x00007fe134933e20...>

pry(main)> car1 = Car.new({type: 'Mail', weight: 5})
# => #<Car:0x87123ffe...>

pry(main)> car2 = Car.new({type: 'Passengers', weight: 1})
# => #<Car:0x8711233abc...>

pry(main)> car3 = Car.new({type: 'Cattle', weight: 3})
# => #<Car:0x007f9c562a5f18...>

pry(main)> car4 = Car.new({type: 'Dining', weight: 4})
# => #<Car:0x007f9c56343038...>

pry(main)> train1 = Train.new({name: 'Thomas', type: 'Tank'})
# => #<Train:0x007fd8858863b8...>

pry(main)> train2 = Train.new({name: 'Emily', type: 'Tender'})
#=> #<Train:0x00007fe1349bed40...>

pry(main)> train3 = Train.new({name: 'Nia', type: 'Tank'})
#=> #<Train:0x00007fe134910650...>

pry(main)> train4 = Train.new({name: 'Gordon', type: 'Express'})
#=> #<FoodTruck:0x00007fe1348a1160...>

pry(main)> train1.add_cars(car1, 5)
pry(main)> train2.add_cars(car1, 3)
pry(main)> train2.add_cars(car4, 4)

pry(main)> train3.add_cars(car1, 4)

pry(main)> train4.add_cars(car4, 5)
pry(main)> train4.add_cars(car3, 10)

pry(main)> train_yard.add_train(train1)
pry(main)> train_yard.add_train(train2)
pry(main)> train_yard.add_train(train3)
pry(main)> train_yard.add_train(train4)

pry(main)> train_yard.sorted_cargo_list
# => ['Cattle', 'Dining', 'Mail']

pry(main)> train_yard.total_inventory
# =>
{
  #<Car:0x87123ffe...> => 12,
  #<Car:0x007f9c562a5f18...>  => 10,
  #<Car:0x007f9c56343038...> => 9>
}

pry(main)> train_yard.overflow_cars
# => [#<Car:0x87123ffe...>]
```


### Iteration 4

Add a method to your TrainYard class called `unload` that takes a car type and a quantity
as arguments. There are two possible outcomes of the `unload` method:

1. If the TrainYard does not have enough of the item in stock to satisfy the given quantity,
this method should return `false`.

2. If the TrainYard has enough cars in stock to satisfy the given quantity, this method should return `true`. Additionally, this method should remove the cars from the Trains. It should look through the Trains in the order they were added and remove the car from the first Train with that item in stock. If that Train does not have enough stock to satisfy the given quantity, the Train's entire cargo of that Car will be depleted, and the remaining quantity will be unloaded from the next Train with that Car in stock. It will follow this pattern until the entire quantity requested has been unloaded.

For example, suppose train1 has 35 mail and train3 has 65 mail, and train1 was added to the event first. If the method unload(<CarXXX, @type = 'Mail'...>, 40) is called, the method should return true, train1's new cargo of mail should be 0, and train3's new stock of mail should be 60.

```ruby
pry(main)> require './lib/car'
# => true

pry(main)> require './lib/train'
# => true

pry(main)> require './lib/train_yard'
# => true

pry(main)> train_yard = TrainYard.new({location: 'Brighton'})
# => #<TrainYard:0x00007fe134933e20...>

pry(main)> car1 = Car.new({type: 'Mail', weight: 5})
# => #<Car:0x87123ffe...>

pry(main)> car2 = Car.new({type: 'Passengers', weight: 1})
# => #<Car:0x8711233abc...>

pry(main)> car3 = Car.new({type: 'Cattle', weight: 3})
# => #<Car:0x007f9c562a5f18...>

pry(main)> car4 = Car.new({type: 'Dining', weight: 4})
# => #<Car:0x007f9c56343038...>

pry(main)> train1 = Train.new({name: 'Thomas', type: 'Tank'})
# => #<Train:0x007fd8858863b8...>

pry(main)> train2 = Train.new({name: 'Emily', type: 'Tender'})
#=> #<Train:0x00007fe1349bed40...>

pry(main)> train3 = Train.new({name: 'Nia', type: 'Tank'})
#=> #<Train:0x00007fe134910650...>

pry(main)> train4 = Train.new({name: 'Gordon', type: 'Express'})
#=> #<FoodTruck:0x00007fe1348a1160...>

pry(main)> train1.add_cars(car1, 5)
pry(main)> train2.add_cars(car1, 3)
pry(main)> train2.add_cars(car4, 4)

pry(main)> train3.add_cars(car1, 4)

pry(main)> train4.add_cars(car4, 5)
pry(main)> train4.add_cars(car3, 10)

pry(main)> train_yard.add_train(train1)
pry(main)> train_yard.add_train(train2)
pry(main)> train_yard.add_train(train3)
pry(main)> train_yard.add_train(train4)

pry(main)> train_yard.unload(car3, 100)
# => false

pry(main)> train_yard.unload(car1, 7)
# => true

pry(main)> train1.count_cars(car1)
# => 0

pry(main)> train2.count_cars(car1)
# => 1
```
