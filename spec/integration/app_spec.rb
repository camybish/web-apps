require "spec_helper"
require_relative '../../app'
require "rack/test"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/names')
      expected_response = 'Julia, Mary, Karim'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end
end