require 'spec_helper'

describe 'Driver Index webpage:' do
  before do
    @appl_name = "RockSolid"
    @page_name = "Driver Listing"
  end
  describe 'when the Driver Index webpage is visited,' do
    before do
      visit drivers_path
    end
    describe 'Header Section:' do
      it 'should display the application name in the header,' do
        expect(page).to have_css('h1', text: @appl_name)
      end
      describe 'Navigation Section:' do
        it 'should display navigation bar,' do
          expect(page).to have_css('body div nav')
        end
        describe 'Nav options:' do
          it 'should have a link to Home' do
            expect(page).to have_link('Home', href: '/')
          end
          it 'should have a link to Setup' do
            expect(page).to have_link('Setup', href: '/setup')
          end
          it 'should have a link to Add' do
            expect(page).to have_link('Add', href: '/drivers/new')
          end
        end
      end
    end
    describe 'Body Section:' do
      it 'should display the page title,' do
        expect(page).to have_css('body h2', text: @page_name)
      end
      it 'should display data in a table,' do
        expect(page).to have_css('body div table')
      end
      describe 'Table Columns:' do
        before do
          @col1 = 'Name'
        end
        it 'table column 1 should be Name,' do
          expect(page).to have_css('body div table thead tr th', text: @col1)
        end
        it 'should have an Show button,' do
          page.has_selector?('body div table tbody tr td form button#Show')
        end
        it 'should have an Edit button,' do
          page.has_selector?('body div table tbody tr td form button#Edit')
        end
        it 'should have a Delete button,' do
          page.has_selector?('body div table tbody tr td form button#Delete')
        end
      end
    end
  end

end
