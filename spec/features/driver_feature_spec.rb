require 'spec_helper'

describe 'Driver:' do

  describe 'Given attributes of a Driver,' do
    before do
      # User test input for a web form is always a string.
      @name   = 'LargeMarge'
    end
    describe 'after the Driver Add (create) path is visited,' do
      before do
        visit new_driver_path
        # <input name="" ...>
        fill_in "name",   with: @name
        # <button>Add</button>
        find_button('Add').click
      end
      it 'should redirect to the Driver index page,' do
        current_path.should == drivers_path
      end
      it 'should list the added Driver.' do
        page.should have_content(@customer)
      end
    end

    describe 'Show:' do
      pending
    end

    describe 'Edit:' do
      pending
    end

    describe 'Delete:' do
      pending
    end

  end

end
