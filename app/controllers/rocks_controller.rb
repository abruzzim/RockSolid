=begin
 Filename: app/controllers/rocks.rb
 Directory: /Users/abruzzim/Documents/ga_wdi/projects/rocksolid/
 Author: Mario Abruzzi
 Date: 17-Jan-2014
 Desc: Project 1
 Notes: 
=end

class RocksController < ApplicationController
  # GET /rocks
  def index
    @rocks = Rock.all
  end

  # GET /rocks/1
  def show
    @rock = Rock.find(params[:id])
  end

  # GET /rocks/new
  def new
    @rock = Rock.new
  end

  # POST /rocks
  def create
    Rock.create({
      rtype:      params[:rtype],
      rgrade:     params[:rgrade],
      rform:      params[:rform],
      rthickness: params[:rthickness],
      unit_price: params[:unit_price]
      })
    redirect_to rocks_path
  end

  # GET /rocks/1/edit
  def edit
    @rock = Rock.find(params[:id])
  end

  # PUT /rocks/1
  def update
    @rock = Rock.find(params[:id])
    @rock.update_attributes(
      rtype:      params[:rtype],
      rgrade:     params[:rgrade],
      rform:      params[:rform],
      rthickness: params[:rthickness],
      unit_price: params[:unit_price]
      )
    redirect_to rocks_path
  end

  # DELETE /rocks/1
  def destroy
    @rock = Rock.find(params[:id])
    @rock.destroy
    redirect_to rocks_path
  end
end
