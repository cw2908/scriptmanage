require 'resque_web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index'
  get '/services',          to: 'services#index'
  post '/services',         to: 'services#create', :defaults => { :format => :json }
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user, lambda {|u|  !Rails.env.production? || u.role == 'admin'} do
    mount ResqueWeb::Engine => "admin/resque_web"
  end
end
