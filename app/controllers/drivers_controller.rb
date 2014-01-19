class DriversController < ApplicationController
  # GET /drivers
  def index
    # Get all driver rows.
    @drivers = Driver.all
    # Call drivers/index.html.erb
  end

  # GET /drivers/1
  def show
    # Get the selected row.
    @driver = Driver.find(params[:id])
    # Call drivers/show.html.erb
  end

  # GET /drivers/new
  def new
    # Create a new object.
    @driver = Driver.new
    # Call drivers/new.html.erb
  end

  # POST /drivers
  def create
    # Create row from view parameters.
    Driver.create({name: params[:name]})
    # Redirect to drivers/index.html.erb
    redirect_to drivers_path
  end

  # GET /drivers/1/edit
  def edit
    # Get the selected row.
    @driver = Driver.find(params[:id])
    # Call drivers/edit.html.erb
  end

  # PUT /drivers/1
  def update
    # Get the row to update.
    @driver = Driver.find(params[:id])
    # Update the row attributes.
    @driver.update_attributes(name: params[:name])
    # Redirect to drivers/index.html.erb
    redirect_to drivers_path
  end

  # DELETE /drivers/1
  def destroy
    # Get the row to delete.
    @driver = Driver.find(params[:id])
    # Delete the record.
    @driver.destroy
    # redirect to driver/index.html.erb
    redirect_to drivers_path
  end
end
