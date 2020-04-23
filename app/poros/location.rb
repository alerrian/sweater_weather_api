class Location
  attr_reader :lat,
              :long

  def initialize(location)
    @location = get_location(location)
    @lat = @location[:lat]
    @long = @location[:lng]
  end

  private

  def get_location(location)
    data = GoogleService.new
    location_data = data.location_data(location)

    location_data[:results].first[:geometry][:location]
  end
end
