=begin
 Filename: app/controllers/trucks.rb
 Directory: /Users/abruzzim/Documents/ga_wdi/projects/rocksolid/
 Author: Mario Abruzzi
 Date: 17-Jan-2014
 Desc: Project 1
 Notes: 
=end

class TrucksController < ApplicationController
  # GET /trucks
  def index
    @trucks = Truck.all
  end

  # GET /trucks/1
  def show
    @truck = Truck.find(params[:id])
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # POST /trucks
  def create
    Truck.create({
      lic_plate: params[:lic_plate],
      capacity:  params[:capacity]
      })
    redirect_to trucks_path
  end

  # GET /trucks/1/edit
  def edit
    @truck = Truck.find(params[:id])
  end

  # PUT /trucks/1
  def update
    @truck = Truck.find(params[:id])
    @truck.update_attributes(
      lic_plate: params[:lic_plate],
      capacity:  params[:capacity]
      )
    redirect_to trucks_path
  end

  # DELETE /trucks/1
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy
    redirect_to trucks_path
  end
end
