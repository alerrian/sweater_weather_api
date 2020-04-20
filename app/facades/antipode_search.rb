class AntipodeSearch
  attr_accessor :location_name,
                :forecast,
                :search_location,
                :id

  def initialize(lat, long)
    @id = nil
    @lat = lat
    @long = long
    @search_location = get_search_city.fourth[:long_name]
    @antipode_lat = get_antipode[:lat]
    @antipode_long = get_antipode[:long]
    @location_name = get_antipode_city.second[:long_name]
    @forecast = get_antipode_weather
  end

  private

  def get_antipode
    service = AntipodeService.new
    antipode_data = service.antipode_location(@lat, @long)
    antipode_data[:data][:attributes]
  end

  def get_search_city
    service = GoogleService.new

    city_data = service.reverse_location_data(@lat, @long)
    city_data[:results].first[:address_components]
  end

  def get_antipode_city
    service = GoogleService.new

    city_data = service.reverse_location_data(@antipode_lat, @antipode_long)
    city_data[:results].first[:address_components]
  end

  def get_antipode_weather
    service = OpenWeatherService.new
    weather = service.weather_data(@antipode_lat, @antipode_long)

    { summary: weather[:current][:weather].first[:main], 
      current_temperature: weather[:current][:temp] }
  end
end
