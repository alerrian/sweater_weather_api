require 'rails_helper'

RSpec.describe 'As a user' do
  before :each do
    @user = User.create!(
      email: 'user1000@mail.com',
      password: 'password'
    )
  end

  it 'can login with proper credentials', :vcr do 
    post "/api/v1/sessions", params: { 
      users: { 
        email: @user.email,
        password: @user.password
      }
    }

    expect(response).to be_successful
  end

  it 'can login with proper credentials', :vcr do 
    post "/api/v1/sessions", params: { 
      users: { 
        email: @user.email,
        password: 'password1'
      }
    }

    expect(response).to_not be_successful
  end
end
