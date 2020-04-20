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
    future_time = @travel_time.split.first.to_i + 3

    "#{@weather_info.forecast.hourly_forecast.to_a[future_time].second[:temp]}, #{@weather_info.forecast.hourly_forecast.to_a[future_time].second[:weather].first[:description]}"
  end
end
