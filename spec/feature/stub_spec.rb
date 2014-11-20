require 'rails_helper'

feature 'example feature spec' do
  let(:user) { create :user }

  describe 'visiting the stub page when user is not signed in' do
    before do
      visit root_path
    end

    it 'shows the login page' do
      expect(page).to have_content 'You need to sign in or sign up before continuing'
    end
  end

  describe 'visiting the stub page when user has been signed in' do
    before do
      sign_in_as user
      visit root_path
    end

    it 'shows the stub page content' do
      expect(page).to have_content 'This is a secure stub.  I will be removed later.'
    end
  end
end
