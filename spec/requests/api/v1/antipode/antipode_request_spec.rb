require 'rails_helper'

RSpec.describe 'Antipode API', type: :request do
  before :each do
    @expected = {
      "data": {
        "id": nil,
        "type": 'antipode',
        "attributes": {
          "location_name": 'Yavi',
          "forecast": {
            "summary": 'Clear',
            "current_temperature": 51.51
          },
          "search_location": 'Hong Kong'
        }
      }
    }
  end

  it 'should be able to return a forecast for the antipode of a city', :vcr do
    location = 'Hong Kong'

    get "/api/v1/antipode?location=#{location}"
    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json).to eq(@expected)
  end
end
