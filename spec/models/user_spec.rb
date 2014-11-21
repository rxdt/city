require 'rails_helper'

describe User do
  describe '#authenticate' do
    let!(:user) { create :user,
                         email: 'test@test.com',
                         password: 'password', password_confirmation: 'password' }

    context 'when valid user credentials are supplied' do
      let(:result) { User.authenticate 'test@test.com', 'password' }

      it 'returns the user' do
        expect(result).to eq user
      end
    end

    context 'when an invalid email is supplied' do
      let(:result) { User.authenticate 'bademail', 'password' }

      it 'returns nil' do
        expect(result).to be_nil
      end
    end

    context 'when an invalid password is supplied' do
      let(:result) { User.authenticate 'test@test.com', 'badpassword' }

      it 'returns nil' do
        expect(result).to be_nil
      end
    end
  end
end
