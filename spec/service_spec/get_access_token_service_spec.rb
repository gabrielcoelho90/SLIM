require 'rails_helper'

describe GetAccessTokenService, type: :request do
  describe "#fetch" do
    it "gets an access token from FatSecretAPI" do
      expect(GetAccessTokenService.fetch).to have_key("access_token")
    end
  end
end
