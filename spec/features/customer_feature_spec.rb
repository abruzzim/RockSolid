require 'spec_helper'

describe 'Customer:' do

  describe 'Given attributes of a Customer,' do
    before do
      # User test input for a web form is always a string.
      @name   = 'Frischman'
      @street = '7 Thrush Ct'
      @city   = "East Northport"
      @state  = "NY"
      @zip    = "11731"
    end
    describe 'after the Customer Add (create) path is visited,' do
      before do
        visit new_customer_path
        # <input name="" ...>
        fill_in "name",   with: @name
        fill_in "street", with: @street
        fill_in "city",   with: @city
        fill_in "state",  with: @state
        fill_in "zip",    with: @zip
        find_button('Add').click
      end
      it 'should redirect to the Customer index page,' do
        current_path.should == customers_path
      end
      it 'should display the added Customer.' do
        page.should have_content(@customer)
      end
    end

    describe 'Edit:' do
      pending
    end

    describe 'Delete:' do
      pending
    end

  end

end
