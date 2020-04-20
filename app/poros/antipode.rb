class Antipode
  def initialize(lat, long)
    @lat = lat
    @long = long
    @antipode_lat = get_antipode
    @antipode_long = get_antipode
  end

  def get_antipode
    service = AntipodeService.new
    antipode_data = service.antipode_location(@lat, @long)
    require 'pry'; binding.pry
  end
end
