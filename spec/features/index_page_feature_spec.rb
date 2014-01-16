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
        it 'should have link to Create Page,' do
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
  end
end