require 'resque_web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'application#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # authenticate :user do
  mount ResqueWeb::Engine => "admin/resque_web"
  # end


  defaults format: :json do
    scope module: :api, defaults: {format: :json}, path: 'api' do 
      scope module: :v1 do
        resources :webhooks
      end
    end
  end
end
