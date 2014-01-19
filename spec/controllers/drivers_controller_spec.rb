require 'spec_helper'

# Describe the behavior of Rails controller.

describe DriversController do

  describe "Actions;" do

    let(:valid_attributes)  { {
      name: "LargeMarge", 
      name: "TruckerJoe"
      } }
 
    let(:valid_session) { {
      } }

    describe "GET index" do

      it "assigns all drivers to @drivers" do
        # Create a valid driver record.
        driver = Driver.create! valid_attributes
        # Call index method.
        get :index, {}, valid_session
        # @drivers should equal an array of all drivers.
        expect(assigns(:drivers)).to eq([driver])
      end

      it "renders the index template" do
        # Call index method.
        get :index, {}, valid_session
        expect(response).to render_template("index")
      end

    end

    describe "POST create" do
      describe "with valid params" do

        it "creates a new driver" do
          expect {
            post :create, {driver: valid_attributes}, valid_session
          }.to change(Driver, :count).by(1)
        end

        it "assigns a newly created driver to @driver" do
          post :create, {driver: valid_attributes}, valid_session
          assigns(:driver).should be_a(Driver)
          assigns(:driver).should be_persisted
        end

      end
    end

    describe "GET show" do

      it "assigns the requested driver to @driver" do
        driver = Driver.create! valid_attributes
        get :show, {id: driver.to_param}, valid_session
        expect(assigns(:driver)).to eq(driver)
      end

      it "renders the show template" do
        get :show, {}, valid_session
        expect(response).to render_template("show")
      end
    end

    describe "GET edit" do

      it "assigns the requested driver to @driver" do
        # Insert test data in the table.
        driver = Driver.create! valid_attributes
        # Simulate receiving data from the view.
        get :edit, {id: driver.to_param}, valid_session
        # Compare the newly created data with data 
        # the controller should set.
        expect(assigns(:driver)).to eq(driver)
      end
    end

    describe "PUT update" do
      describe "with valid params" do

        it "updates the requested driver" do
          
          driver = Driver.create! valid_attributes
          Driver.any_instance.should_receive(:update_attributes).with({"name" => "TruckerJoe"})
          put :update, {id: driver.to_param, :driver => {"name" => "TruckerJoe"}}, valid_session
        end
      end
    end

  end

end