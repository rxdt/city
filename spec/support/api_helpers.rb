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

RSpec.shared_examples 'an ok API response' do
  it 'and respond with ok (200) status' do
    expect(response_status).to eq 200
  end
end

RSpec.shared_examples 'a created API response' do
  it 'and respond with created (201) status' do
    expect(response_status).to eq 201
  end
end

RSpec.shared_examples 'a bad request API response' do
  it 'and respond with bad request (400) status' do
    expect(response_status).to eq 400
  end
end

RSpec.shared_examples 'an unauthorized API response' do
  it 'and respond with unauthorized (401) status' do
    expect(response_status).to eq 401
  end
end

RSpec.shared_examples 'a forbidden API response' do
  it 'and respond with forbidden (403) status' do
    expect(response_status).to eq 403
  end
end
