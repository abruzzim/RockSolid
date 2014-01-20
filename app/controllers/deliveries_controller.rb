=begin
 Filename: app/controllers/deliveries.rb
 Directory: /Users/abruzzim/Documents/ga_wdi/projects/rocksolid/
 Author: Mario Abruzzi
 Date: 17-Jan-2014
 Desc: Project 1
 Notes: 
=end

class DeliveriesController < ApplicationController
  # GET /deliveries
  def index
    @deliveries = Delivery.all
  end

  # GET /deliveries/1
  def show
    # pending
    @delivery = Delivery.find(params[:id])
  end

  # GET /deliveries/new
  def new
  end

  # POST /deliveries
  def create
    # pending
    redirect_to deliveries_path
  end

  # GET /deliveries/1/edit
  def edit
    @delivery = Delivery.find(params[:id])
    @trucks   = Truck.all
    @drivers  = Driver.all
  end

  # PUT /deliveries/1
  def update
    delivery = Delivery.find(params[:id])
    delivery.update_attributes(
      ship_date: params[:ship_date]
      )
    #    .update(id, attributes) public
    Truck.update(delivery.truck.id, delivery_id: nil) if delivery.truck != nil
    Truck.update(params[:truck_id], delivery_id: delivery.id)
    #
    Driver.update(delivery.driver.id, delivery_id: nil) if delivery.driver != nil
    Driver.update(params[:driver_id], delivery_id: delivery.id)
    #
    redirect_to deliveries_path
  end

  # DELETE /deliveries/1
  def destroy
    # pending
    #@delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end
end
