# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'API Authorization Handler', type: :request do
  describe ':authorize_request before hook' do
    it 'returns 401 if no auth header sent' do
      get '/api/webhooks'
      expect(response.status).to eq(401)
    end

    it 'renders 401 for unapproved user' do 
      u = User.create!(email: "sample-#{rand(5000)}@example.com", password: 'Test0000000')
      headers = {'Authorization' => u.setting.webhook_token}
      get '/api/webhooks', params: {}, headers: headers
      expect(response.status).to eq(401)
    end
    it 'renders 200 success for valid user token' do 
      u = User.create!(email: "sample-#{rand(5000)}@example.com", password: 'Test0000000', approved: true)
      headers = {'Authorization' => u.setting.webhook_token}
      get '/api/webhooks', params: {}, headers: headers
      expect(response.status).to eq(200)
    end
  end
end
