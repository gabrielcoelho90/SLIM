require 'dotenv/load'
require 'net/http'
require 'json'
# This service is responsable for get the access_token from my food API in order
# to get info from it.
class GetAccessTokenService
  @client_id = ENV['NUTRI_Client_ID']
  @client_secret = ENV['NUTRI_Client_Secret']
  @params = {
    'client_id' => @client_id,
    'client_secret' => @client_secret,
    'grant_type' => 'client_credentials',
    'scope' => 'basic'
  }

  def self.fetch
    url = URI("https://oauth.fatsecret.com/connect/token")

    uri = URI(url)

    request = Net::HTTP::Post.new(uri)
    request.set_form_data(@params)

    resp = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(request)
    end

    JSON.parse(resp.body)
  end
end


# GetAccessTokenService.fetch()
