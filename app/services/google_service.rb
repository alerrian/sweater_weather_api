class GoogleService
  def location_data(location)
    response = connection.get('/maps/api/geocode/json') do |faraday|
      faraday.params['components'] = "locality:#{location}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def trip_data(origin, destination)
    response = connection.get('/maps/api/directions/json') do |faraday|
      faraday.params['origin'] = origin
      faraday.params['destination'] = destination
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  
  def connection
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params['key'] = ENV['GGEO_KEY']
    end
  end
end
