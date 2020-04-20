require 'rails_helper'

RSpec.describe 'Background API', type: :request do
  it 'should be able to retrieve a background for a specific city', :vcr do
    location = 'Denver, CO'

    expected = {
      data: {
        :id=>nil,
        :type=>"background",
        :attributes=>{
          :background_url=>"https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg"
          }
        }
      }

    get "/api/v1/backgrounds?location=#{location}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json).to eq(expected)
  end
end
