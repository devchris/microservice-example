require 'json'
require 'sinatra'
require 'geocoder'
require 'httparty'

get '/forecast/:location' do
  content_type :json

  coordinates = Geocoder.search(params[:location]).first.coordinates
  
  url = 'https://api.darksky.net/forecast/32751df79f6c9f93897968c0d588dd69/'

  response = HTTParty.get(url + coordinates.first.to_s + ',' + coordinates.last.to_s)

  {
    weather: JSON.parse(response.body)
  }.to_json
end