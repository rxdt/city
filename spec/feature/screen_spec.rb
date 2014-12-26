require 'rails_helper'

feature 'screens page feature spec' do
  let(:user) { create :user }
  let!(:screens) { create_list(:screen, 5) }

  describe 'visiting the screens page after user is signed in' do
    before do
      sign_in_as user
      visit screens_path
    end

    # it 'shows the screens page with a Screen name for each screen' do
    #   expect(page).to have_content 'screen_name'
    # end
  end
end
