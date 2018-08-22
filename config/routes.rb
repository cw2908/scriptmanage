require 'resque_web'

Rails.application.routes.draw do
  devise_for :users
  defaults format: :json do
    scope module: :api, defaults: {format: :json}, path: 'api' do 
      scope module: :v1 do
        resources :webhooks
      end
    end
  end
  root to: 'services#index'
  get '/services',          to: 'services#index'
  post '/services',         to: 'services#create', :defaults => { :format => :json }
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user, lambda {|u|  !Rails.env.production? || u.role == 'admin'} do
    mount ResqueWeb::Engine => "admin/resque_web"
  end
end
