require 'rails_helper'

RSpec.describe 'Forecast API', type: :request do
  it 'should be able to retrieve a forecast for a specific city' do
    location = 'Denver, CO'

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
  end
end

