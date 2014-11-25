require 'rails_helper'

feature 'log in and log out' do
  let(:user) { create :user }

  def expect_page_to_have_login_message
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  describe 'when no user is logged in' do
    before do
      visit root_path
    end

    it 'shows the login page' do
      expect_page_to_have_login_message
    end
  end

  describe 'when a user is logged in and signs out' do
    before do
      sign_in_as user
      visit root_path
      click_on 'Sign out'
    end

    it 'returns the user to the login screen' do
      expect_page_to_have_login_message
    end
  end
end
