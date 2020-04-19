class Forecast
  def by_location(location_data)
    service = OpenWeatherService.new
    service.weather_data(location_data.lat, location_data.long)
  end
end
