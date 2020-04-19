class PexelsService
  def background_data(location)
    response = connection.get('/v1/search') do |faraday|
      faraday.params['query'] = location
      faraday.params['page'] = 1
      faraday.params['per_page'] = 1
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def connection
    Faraday.new(url: 'https://api.pexels.com') do |faraday|
      faraday.headers['authorization'] = ENV['PEXELS_KEY']
    end
  end
end
