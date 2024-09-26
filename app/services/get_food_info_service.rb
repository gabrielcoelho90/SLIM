require "net/http"
require "uri"
require "json"
require_relative "get_access_token_service"
require "pp"
require_relative "./application_service.rb"

#This service is responsable for get food info from my API.

class GetFoodInfoService < ApplicationService
  def initialize(name)
    @name = name
  end

  def call
    access_token = GetAccessTokenService.fetch["access_token"]

    uri = URI('https://platform.fatsecret.com/rest/server.api')
    uri.query = URI.encode_www_form({
      "method" => "foods.search",
      "search_expression" => "#{@name}",
      "max_results" => 10,
      "format" => "json"
    })

    headers = {"Authorization" => "Bearer #{access_token}"}

    req = Net::HTTP::Post.new(uri, headers)
    req.content_type = 'application/json'
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req)
    end
    response = JSON.parse(res.body)
    if response.has_key?("error")
      "The response has an error!"
    else
      filter_info(response)
    end
  end

  private
  # The following method was created for the purpose of format the response from the API.
  def filter_info(response)
    array_of_options = response["foods"]["food"]
    array_of_options.map do |array_of_option|
      food_description =  array_of_option["food_description"]
      food_name = array_of_option["food_name"]
      food_description = food_description.delete("|-")
      unit_parameter = food_description.match(/(.+) Cal/, 0)[0].delete("Cal").strip
      calories = food_description.match(/Calories: \d+kcal/, 0)[0].strip
      fat = food_description.match(/Fat: \d+.\d+g/, 0)[0].strip
      carbs = food_description.match(/Carbs: \d+.\d+g/, 0)[0].strip
      protein = food_description.match(/Protein: \d+.\d+g/, 0)[0].strip
      {
        food_name: food_name,
        unit: unit_parameter,
        calories: calories,
        fat: fat,
        carbs: carbs,
        protein: protein
      }
    end
  end
end

# GetFoodInfoService.call("bacon")
