require 'rails_helper'

describe Api::V1::SessionsController, api: true do
  render_views

  let!(:user) { create :user,
                       email: 'test@test.com',
                       password: 'password', password_confirmation: 'password' }

  describe '#create' do
    let(:request) { post api_v1_sessions_path, api_params(params) }

    before :each do
      request
    end

    context 'when valid credentials are provided' do
      let(:params) { { email: 'test@test.com', password: 'password' } }

      it_should_behave_like 'a created API response'

      it 'provides the authentication token' do
        expect(response_body[:user]).to include authentication_token: user.authentication_token
      end
    end

    context 'when bad credentials are provided' do
      let(:params) { { email: 'somebademail', password: 'somebadpassword' } }

      it_should_behave_like 'an unauthorized API response'
    end

    context 'when invalid params are provided' do
      let(:params) { { } }

      it_should_behave_like 'a bad request API response'
    end
  end

end
