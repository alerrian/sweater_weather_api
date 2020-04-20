class TripSearch
  attr_reader :trip_time

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @trip_time = get_trip_time
  end

  private

  def get_trip_time
    service = GoogleService.new
    trip = service.trip_data(@origin, @destination)

    trip[:routes].first[:legs].first[:duration][:text]
  end
end
