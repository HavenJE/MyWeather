# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Created a variable to make a get request to the api endpoint 
# BASE_URL = 'https://api.weatherbit.io/v2.0/current?&key=API_KEY'
# KEY = '1280f7e8b1994ff29a55837c7433ea27'

require 'net/http'
require 'open-uri'
require 'json'
require 'pry'


URL = ("https://api.weatherbit.io/v2.0/forecast/minutely?city=Charlotte,NC&key=1280f7e8b1994ff29a55837c7433ea27")

def api_info
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
    locations_info = JSON.parse(file)
    locations_info.each do |location|
        Location.create(
            city_name: location["city_name"],
            state_code: location["state_code"],  
            country_code: location["country_code"],
            lon: location["lon"], 
            lat: location["lat"], 
            data: location["data"][60]
        )
    end 
    file = api_info()
end 





# binding.pry

# location["data"] => all data 60 items 
# location["data"][0]
# location["data"][30]
# location["data"][60]



 # params = { "city_name" => ": " },
            # params = { "lon" => ": " }


# Location.create(
#         city_name: location[:"city_name"], 
#         lon: location[:"lon"], 
#         lat: location[:"lat"], 
#         country_code: location[:"country_code"], 
#         state_code: location[:"state_code"], 
#         data: location[:"data"]
#         )
#     end


# arrays_data = location.data
# arrays_data.map do |array|
#     timestamp_local: array[:"timestamp_local"],
#     snow: array[:"snow"],
#     temp: array[:"temp"],
#     precip: array[:"precip"]
# end 

# def weather_api
#     # Created a variable to make a get request to the api endpoint 
#     response = RestClient.get('https://api.weatherbit.io/v2.0/forecast/minutely?city=Charlotte,NC&key=1280f7e8b1994ff29a55837c7433ea27')

#     locations = JSON.parse(response)
    
#     locations.each do |location|
        
#         Location.create(
#             binding.pry
#             # city_name: location["city_name"],  
            
#             # lon: location["lon"], 
#             # lat: location["lat"], 
#             # country_code: location["country_code"], 
#             # state_code: location["state_code"], 
#             # data: location["data"]
#         )
#     end 
# end 
# weather_api()