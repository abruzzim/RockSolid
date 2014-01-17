require 'spec_helper'

describe 'Setup webpage:' do
  describe 'when the Setup Page is visited,' do
    before do
      visit '/setup'
    end
    it 'should display Setup in the header,' do
      expect(page).to have_css('h2', :text => 'Setup')
    end
    describe 'Nav Bar:' do
      it 'should display Nav Bar,' do
        expect(page).to have_css('nav')
      end
      describe 'Nav Options:' do
        it 'should have link to Home,' do
          expect(page).to have_link('Home', :href => '/')
        end
        it 'should have link to Customer,' do
          expect(page).to have_link('Customer', :href => '/customers')
        end
        it 'should have link to Driver,' do
          pending
          expect(page).to have_link('Driver', :href => '/drivers')
        end
        it 'should have link to Truck,' do
          pending
          expect(page).to have_link('Truck', :href => '/trucks')
        end
        it 'should have link to Catalog,' do
          pending
          expect(page).to have_link('Catalog', :href => '/rocks')
        end
      end
    end
  end
end