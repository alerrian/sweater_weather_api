class BackgroundSearch
  def initialize(location)
    @location = location.split(',').first
    @background = get_background
  end

  def get_background
    service = PexelsService.new
    background = service.background_data(@location)

    LocationBackground.new(@location, background)
  end
end
