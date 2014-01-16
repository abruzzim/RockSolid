# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

@order_num   = "Q9876"
@cust_name   = "Mario"
@cust_street = "234 West 34"
@cust_city   = "New York"
@cust_state  = "NY"
@cust_zip    = "11736"
@sdate       = "2014-01-15"
@ship_street = "234 West 34"
@ship_city   = "New York"
@ship_state  = "NY"
@ship_zip    = "11736"
Order.create({
  order_num: @order_num,
  customer_id: Customer.create({
                  name: @cust_name,
                  address_id: Address.create({
                                street: @cust_street,
                                city:   @cust_city,
                                state:  @cust_state,
                                zip:    @cust_zip}).id}).id,
  delivery_id: Delivery.create({
                  ship_date: @sdate,
                  address_id: Address.create({
                                street: @ship_street,
                                city:   @ship_city,
                                state:  @ship_state,
                                zip:    @ship_zip
                              }).id})
})
