require 'rails_helper'

RSpec.describe 'Road Trip API' do
  before :each do
    @user = User.create!(
      email: 'user1000@mail.com',
      password: 'password',
      password_confirmation: 'password',
      api_key: 'VfFRgKZMw5TXJD7zZ2mNZ6tB'
    )

    @expected = {
      "data": {
        "id": nil,
        "type": 'trip',
        "attributes": {
          "origin": 'Denver, CO',
          "destination": 'Pueblo, CO',
          "travel_time": '1 hour 48 mins',
          "arrival_forecast": '65.34, Clear'
        }
      }
    }
  end

  it 'can make a post to road_trip that authenticates by api_key and returns weather', :vcr do
    post '/api/v1/road_trip', params: {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: 'VfFRgKZMw5TXJD7zZ2mNZ6tB'
    }

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(json).to eq(@expected)
  end

  it 'cannot make a bad request', :vcr do
    post '/api/v1/road_trip', params: {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: ''
    }

    expect(response).to_not be_successful
  end
end
