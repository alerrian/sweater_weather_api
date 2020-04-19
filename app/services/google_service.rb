class GoogleService
  def location_data(location)
    response = connection.get('/maps/api/geocode/json') do |faraday|
      faraday.params['key'] = ENV['GGEO_KEY']
      faraday.params['components'] = "locality:#{location}"
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://maps.googleapis.com')
  end
end
