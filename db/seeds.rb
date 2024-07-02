require 'http'

activity = 'box'
api_url = "https://api.api-ninjas.com/v1/caloriesburned?activity=#{activity}"
headers = { 'X-Api-Key' => ENV['API_KEY'] }

response = HTTP.headers(headers).get(api_url)

if response.status.success?
  data = response.parse
  activity_data = Sport.create!(
    name: activity,
    calories_met: data.first['calories_per_hour']
  )
  puts "Sucess Saved"
else
  render json: { error: response.status, message: response.to_s }, status: response.code
  puts "Gone wrong"
end

puts "Db Seeded"
