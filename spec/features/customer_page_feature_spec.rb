require 'spec_helper'

describe 'Customer Index webpage:' do

  describe 'when the Customer Index webpage is visited,' do
    before do
      visit customers_path
    end
    describe 'Header Section:' do
      it 'should display Customer in the header,' do
        expect(page).to have_css('h2', :text => 'Customer')
      end
      describe 'Navigation Section:' do
        it 'should display navigation bar,' do
          expect(page).to have_css('nav')
        end
        describe 'Nav options:' do
          it 'should have a link to Home' do
            expect(page).to have_link('Home', :href => '/')
          end
          it 'should have a link to Setup' do
            expect(page).to have_link('Setup', :href => '/setup')
          end
          it 'should have a link to Add' do
            expect(page).to have_link('Add', :href => 'new_customer_path')
          end
        end
      end
    end
    describe 'Page Body:' do
      pending
    end
  end

end
