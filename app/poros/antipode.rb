class Antipode
  def initialize(lat, long)
    @lat = lat
    @long = long
    @antipode_lat = get_antipode[:lat]
    @antipode_long = get_antipode[:long]
  end

  def get_antipode
    service = AntipodeService.new
    antipode_data = service.antipode_location(@lat, @long)
    antipode_data[:data][:attributes]
  end
end
