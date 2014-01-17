require 'spec_helper'

describe 'Index webpage:' do

  describe 'when the Index Page is visited,' do
    before do
      visit '/'
    end
    it 'should display Order in the header,' do
      expect(page).to have_css('h2', :text => 'Order')
    end

    describe 'Nav Bar:' do
      it 'should have a navigation menu,' do
        expect(page).to have_css('nav')
      end
      describe 'Nav Option:' do
        it 'should display Create in <a> tag,' do
          expect(page).to have_css('a', :text => 'Create')
        end
        it 'should have link to Create New Order Form,' do
          pending
          expect(page).to have_link('Create', :href => '<%= orders_path %>')
        end
        it 'should display Setup in <a> tag,' do
          expect(page).to have_css('a', :text => 'Setup')
        end
        it 'should have link to Setup Page,' do
          expect(page).to have_link('Setup', :href => '/setup')
        end
      end
    end

    describe 'Content:' do
      describe 'Order Table:' do
        describe 'Table Heading:' do
          it 'should display the Order Number table column,' do
            expect(page).to have_css('th', :text => 'Order Number')
          end
        end
        describe 'Table Body' do
          it 'should have an Edit button in the table body' do
            expect(page).to have_css('div table tbody tr td form button', :text => 'Edit')
          end
          it 'should have a Delete button in the table body' do
            expect(page).to have_css('div table tbody tr td form button', :text => 'Delete')
          end
        end
      end
    end

  end

end