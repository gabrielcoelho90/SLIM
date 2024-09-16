require 'rails_helper'

describe GetAccessTokenService, type: :request do
  let(:client_id) { ENV['NUTRI_Client_ID'] }
  let(:client_secret) { ENV['NUTRI_Client_Secret'] }

  it 'retrieves client_id and client_secret from ENV' do
    expect(client_id).to be_a(String)
    expect(client_secret).to be_a(String)
  end

  it "sends the correct params" do
    params = {
      'client_id' => client_id,
      'client_secret' => client_secret,
      'grant_type' => 'client_credentials',
      'scope' => 'basic'
    }

    expect(GetAccessTokenService.instance_variable_get(:@params)).to eq(params)
  end

  describe "#fetch" do
    it "verifies the correct endpoint" do
      uri = URI("https://oauth.fatsecret.com/connect/token")
      fake_response = double('response', body: { 'access_token' => 'fake_token' }.to_json)
      allow(Net::HTTP).to receive(:start).with(uri.host, uri.port, use_ssl: uri.scheme == 'https').and_yield(double('http', request: fake_response))
      GetAccessTokenService.fetch
      expect(Net::HTTP).to have_received(:start).with(uri.host, uri.port, use_ssl: uri.scheme == 'https')
    end

    it "checks if the response was successful" do
      fake_response = double('response', body: { access_token: 'fake_token' }.to_json)
      parsed_body = JSON.parse(fake_response.body, symbolize_names: true)
      expect(parsed_body).to have_key(:access_token)
    end
  end
end
