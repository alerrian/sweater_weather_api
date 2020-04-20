require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  it 'can register a user and return an api key in the response', :vcr do
    email = 'user1000@mail.com'
    password = 'password'
    password_confirmation = 'password'
  
    post "/api/v1/users", params: { 
      users: { 
        email: 'user1000@mail.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }

    expect(response).to be_successful
  end

  it 'can get a bad request', :vcr do
    email = 'user1000@mail.com'
    password = 'password'
    password_confirmation = 'password'
  
    post "/api/v1/users", params: { 
      users: { 
        email: 'user1000@mail.com',
        password: 'password',
        password_confirmation: 'password1'
      }
    }

    expect(response).not_to be_successful
  end
end
