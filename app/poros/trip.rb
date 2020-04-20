class Trip
  attr_reader :origin,
              :destination,
              :travel_time,
              :arrival_forecast,
              :id

  def initialize(trip_time, weather_info, origin, destination)
    @id = nil
    @weather_info = weather_info
    @origin = origin
    @destination = destination
    @travel_time = trip_time.trip_time
    @arrival_forecast = get_forecast_data
  end

  private

  def get_forecast_data
    "#{@weather_info.forecast.current_temp}, #{@weather_info.forecast.current_description}"
  end
end
