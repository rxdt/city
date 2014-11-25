require 'rails_helper'

feature 'application header' do
  let(:investor) { create :user, role: :investor }
  let(:admin) { create :user, role: :admin }

  describe 'when no user is logged in' do
    before do
      visit root_path
    end

    it 'shows the brand' do
      expect(page).to have_css '.brand'
    end

    it 'does not show links' do
      expect(page).not_to have_css '.links'
    end
  end

  describe 'when user is logged in as an administrator' do
    before do
      sign_in_as admin
      visit root_path
    end

    it 'shows the brand' do
      expect(page).to have_css '.brand'
    end

    it 'shows a signout link' do
      expect(page).to have_link 'Sign out'
    end

    it 'shows an administration link' do
      expect(page).to have_link 'Admin'
    end
  end

  describe 'when user is logged in as an investor' do
    before do
      sign_in_as investor
      visit root_path
    end

    it 'shows the brand' do
      expect(page).to have_css '.brand'
    end

    it 'shows a signout link' do
      expect(page).to have_link 'Sign out'
    end

    it 'does not show an administration link' do
      expect(page).not_to have_link 'Admin'
    end
  end
end
