require 'resque_web'

Rails.application.routes.draw do
  devise_for :users
  defaults format: :json do
    scope module: :api, defaults: {format: :json}, path: 'api' do 
      scope module: :v1 do
        post '/webhooks',         to: 'webhooks#create'
        post '/services',         to: 'services#create', :defaults => { :format => :json }
        get '/services',          to: 'services#index'
      end
    end
  end
  root to: 'application#index'
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user, lambda {|u|  !Rails.env.production? || u.role == 'admin'} do
    mount ResqueWeb::Engine => "admin/resque_web"
  end
end
