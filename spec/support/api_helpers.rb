module ApiHelpers
  extend ActiveSupport::Concern
  include Rack::Test::Methods

  def app
    Rails.application
  end

  included do
    let(:response_status) { last_response.status }
    let(:response_body) { JSON.parse(last_response.body).deep_symbolize_keys }

    def api_params params
      { format: :json }.merge params
    end
  end
end

RSpec.shared_examples 'an unauthorized API response' do
  it 'responds with unauthorized status' do
    expect(response_status).to eq 401
  end
end

RSpec.shared_examples 'a created API response' do
  it 'responds with status CREATED' do
    expect(response_status).to eq 201
  end
end
