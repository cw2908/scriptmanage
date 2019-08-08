# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Inbound Requests', type: :request do
  describe 'index' do
    it 'returns 401 if no auth sent' do
      get '/api/webhooks'
      expect(response.status).to eq(401)
    end

    it 'renders success for valid user token' do 
      u = User.create!(email: "sample@example.com", password: 'Test0000000')
      headers = {'Authorization' => u.setting.webhook_token}
      get '/api/webhooks', params: {}, headers: headers
      expect(response.status).to eq(200)
    end
  end
end