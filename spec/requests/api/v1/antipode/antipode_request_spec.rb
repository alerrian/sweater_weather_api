require 'rails_helper'

RSpec.describe 'Antipode API', type: :request do
  it 'should be able to return a forecast for the antipode of a city', :vcr do
    location = 'Hong Kong'

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful
  end
end
