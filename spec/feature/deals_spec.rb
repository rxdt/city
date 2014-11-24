require 'rails_helper'

feature 'deals page feature spec' do
  let(:user) { create :user }
  let!(:deals) { create_list(:deal, 7) }

  describe 'visiting the deals page after user is signed in' do
    before do
      sign_in_as user
      visit deals_path
    end

    it 'shows the deals page with a company name and blurb for each deal' do
      expect(page).to have_content 'company_name'
      expect(page).to have_content 'blurb'
    end

    it 'should show mutliple records' do
      expect(page).to have_selector('.deal_cell', count: 7)
    end
  end
end
