class ForecastSearch
  attr_reader :forecast

  def initialize(location)
    @location = location
    @forecast = get_forecast
  end

  def get_forecast
    location_data = Location.new(@location)
    weather = Forecast.new
    weather_data = weather.by_location(location_data)

    LocationForecast.new(@location, weather_data)
  end
end
