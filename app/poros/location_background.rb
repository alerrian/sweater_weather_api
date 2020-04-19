class LocationBackground
  attr_reader :location,
              :background_url,
              :id

  def initialize(location, background)
    @id = nil
    @location = location
    @background = background
    @background_url = get_background_url
  end

  private

  def get_background_url
    @background[:photos].first[:src][:original]
  end
end
