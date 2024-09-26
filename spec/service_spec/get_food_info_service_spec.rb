require 'rails_helper'
require 'webmock/rspec'

describe GetFoodInfoService, type: :service do

  let(:access_token) { 'fake_token' }
  let(:response_body) {
  {
    "foods"=>
      {"food"=>
        [{"food_description"=>"Per 100g - Calories: 147kcal | Fat: 9.94g | Carbs: 0.77g | Protein: 12.58g",
          "food_id"=>"3092",
          "food_name"=>"Egg",
          "food_type"=>"Generic",
          "food_url"=>"https://www.fatsecret.com/calories-nutrition/generic/egg-whole-raw"}],
      "max_results"=>"10",
      "page_number"=>"0",
      "total_results"=>"1192"}
  }.to_json
  }
  let(:uri) { URI('https://platform.fatsecret.com/rest/server.api') }
  let(:headers) { { "Authorization" => "Bearer #{access_token}" } }

  before do
    stub_request(:post, uri.to_s)
      .with(
        query: {
          "method" => "foods.search",
          "search_expression" => "eggs",
          "max_results" => 10,
          "format" => "json"
        },
        headers: headers
      )
      .to_return(status: 200, body: response_body, headers: {})

    allow(GetAccessTokenService).to receive(:fetch).and_return("access_token" => access_token)
  end

  it "sends a HTTP request with the correct params and returns filtered info" do
    result = GetFoodInfoService.call("eggs")

    expect(WebMock).to have_requested(:post, uri.to_s)
      .with(
        query: {
          "method" => "foods.search",
          "search_expression" => "eggs",
          "max_results" => 10,
          "format" => "json"
        },
        headers: headers
      )

    expect(result).to eq([
      {
        food_name: "Egg",
        unit: "Per 100g",
        calories: "Calories: 147kcal",
        fat: "Fat: 9.94g",
        carbs: "Carbs: 0.77g",
        protein: "Protein: 12.58g"
      }
    ])
  end
end
