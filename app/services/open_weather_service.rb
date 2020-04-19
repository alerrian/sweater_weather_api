class OpenWeatherService
  def weather_data(lat, long)
    connection.get('/data/2.5/onecall') do |faraday|
      faraday.params['lat'] = lat
      faraday.params['lon'] = long
      faraday.params['appid'] = ENV['OWM_KEY']
    end
  end

  private

  def connection
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
