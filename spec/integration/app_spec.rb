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

  context "POST / sort-names" do
    it 'returns 200 OK' do
      response = post('/sort-names', names: "Joe,Alice,Zoe,Julia,Keiran")

      expected_response = "Alice,Joe,Julia,Keiran,Zoe"

      expect(response.status).to eq(200)
      expect(response.body).to eq expected_response
    end

    it 'returns 500 not found' do
      response = post('/sort-names', names: [1,3,3,4])

      expect(response.status).to eq 500
    end
  end
end