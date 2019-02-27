require 'json'
require 'sinatra'
require 'geocoder'
require 'httparty'

get '/' do
  content_type :json

  # {
  #   coordinates: Geocoder.search('Indianapolis').first.coordinates
  # }.to_json

  response = HTTParty.get('https://api.darksky.net/forecast/32751df79f6c9f93897968c0d588dd69/37.8267,-122.4233')

  {
    weather: JSON.parse(response.body)
  }
end

get 'forecast/:location' do
  content_type :json
  coordinates = Geocoder.search(params[:location]).first.coordinates
  url = 'https://api.darksky.net/forecast/32751df79f6c9f93897968c0d588dd69/'
  respone = HTTParty.get(url + coordinates.first.to_f + ',' + coordinates.last.to_f)
end