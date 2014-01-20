# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cargo.delete_all
Address.delete_all

# Add New Customer with linked (new) Address.

class CustomersRow
  def initialize
    @cust_street = Faker::Address.street_address
    @cust_city   = Faker::Address.city
    @cust_state  = Faker::Address.state_abbr
    @cust_zip    = Faker::Address.zip
    @cust_name   = Faker::Name.last_name
  end
  def populate
    Address.create({
      street:      @cust_street,
      city:        @cust_city,
      state:       @cust_state,
      zip:         @cust_zip,
      customer_id: Customer.create({name: @cust_name}).id
      })
    puts "%SEED-I-CUSTOMERS, attempting row add."
    # Answers: 
    #   Customer.last.addresses[0]["street"]
    #   Customer.find(7).addresses.first.street
    #   Customer.where(name: "Koepp").first.addresses.where(state: "MN").first.street
  end
end
Customer.delete_all
10.times {CustomersRow.new.populate}

# Add New Order with (linked) new Cargo and (linked) new Rock

class OrderRow
  def initialize
    @seeds = [
      {type: "Igneous", grade: "High", form: "Slab",   thickness: 2,   price: 50.00, qty: 5,  ordnum: "Q00123"},
      {type: "Igneous", grade: "Med",  form: "Slab",   thickness: 2,   price: 40.00, qty: 7,  ordnum: "Q00456"},
      {type: "Igneous", grade: "Low",  form: "Slab",   thickness: 2,   price: 30.00, qty: 9,  ordnum: "Q00789"},
      {type: "Igneous", grade: "High", form: "Gravel", thickness: nil, price: 99.88, qty: 25, ordnum: "Q06789"},
      {type: "Igneous", grade: "Low",  form: "Gabion", thickness: 2,   price: 13.76, qty: 9,  ordnum: "Q08765"},
    ]
  end
  def populate
    @seeds.each do |seed|
      Rock.create({
        rtype:      seed[:type],
        rgrade:     seed[:grade],
        rform:      seed[:form],
        rthickness: seed[:thickness],
        unit_price: seed[:price],
        cargo_id: Cargo.create({
                    quantity: seed[:quantity],
                    order_id: Order.create({
                                order_num: seed[:ordnum],
                              }).id
                    }).id
        })
      puts "%SEED-I-ORDERS, attempting row add."
      # Answers: 
      #   Order.find(2).cargo.quantity.to_f
      #   Order.find(2).cargo.rock.unit_price.to_f
    end
  end
end
Order.delete_all
#OrderRow.new.populate

# Add New Delivery with (linked) new Customer, Order, Cargo and Rock

class DeliveriesRow
  def initialize
    @seeds = [
      {type: "Igneous", grade: "Med",  form: "Slab", thickness: 2, price: 90.00, qty: 4, ordnum: "Q00765", sdate: "2014-01-29"},
      {type: "Igneous", grade: "High", form: "Slab", thickness: 2, price: 90.35, qty: 2, ordnum: "Q00799", sdate: "2014-02-15"}
    ]
  end
  def populate
    @seeds.each do |seed|
      Rock.create({
        rtype:      seed[:type],
        rgrade:     seed[:grade],
        rform:      seed[:form],
        rthickness: seed[:thickness],
        unit_price: seed[:price],
        cargo_id: Cargo.create({
                    quantity: seed[:quantity],
                    order_id: Order.create({
                                order_num:    seed[:ordnum],
                                customer_id:  Customer.create({
                                                name: Faker::Name.last_name,
                                              }).id,
                                delivery_id:  Delivery.create({
                                                ship_date: seed[:sdate]
                                              }).id
                              }).id,
                  }).id
      })
      puts "%SEED-I-DELIVERIES, attempting row add."      
    end
  end
end
Delivery.delete_all
#DeliveriesRow.new.populate

# Add Rock

class RockRow
  def initialize
    @seeds = [
      {type: "Sedimentary", grade: "Med",  form: "Silt",    thickness: nil, price: 23.45,  qty: 1,  ordnum: "Q98765"},
      {type: "Sedimentary", grade: "High", form: "Sand",    thickness: nil, price: 13.45,  qty: 5,  ordnum: "Q48484"},
      {type: "Igneous",     grade: "Med",  form: "Gravel",  thickness: nil, price: 123.45, qty: 11, ordnum: "Q10100"},
      {type: "Igneous",     grade: "High", form: "Gabion",  thickness: nil, price: 103.45, qty: 8,  ordnum: "Q73737"},
      {type: "Igneous",     grade: "High", form: "Boulder", thickness: nil, price: 323.45, qty: 3,  ordnum: "Q63017"}
    ]
  end
  def populate
    @seeds.each do |seed|
      Rock.create({
        rtype:      seed[:type],
        rgrade:     seed[:grade],
        rform:      seed[:form],
        rthickness: seed[:thickness],
        unit_price: seed[:price]
        })
      puts "%SEED-I-ROCKS, attempting row add."
    end
  end
end
Rock.delete_all
#RockRow.new.populate

# Add New Drivers.

class DriversRow
  def initialize
  end
  def populate
    Driver.create({
      name: Faker::Name.first_name
      })
    puts "%SEED-I-DRIVERS, attempting row add."
  end
end
Driver.delete_all
3.times {DriversRow.new.populate}

# Add New Trucks.

class TrucksRow
  def initialize
    @seeds = [
      {plate: "QRY-123", capacity: 25},
      {plate: "QRY-234", capacity: 25},
      {plate: "QRY-456", capacity: 25},
      {plate: "QRY-678", capacity: 25},
      {plate: "QRY-890", capacity: 25}
    ]
  end
  def populate
    @seeds.each do |seed|
      Truck.create({
        lic_plate: seed[:plate],
        capacity:  seed[:capacity]
        })
      puts "%SEED-I-TRUCKS, attempting row add."
    end
  end
end
Truck.delete_all
TrucksRow.new.populate
