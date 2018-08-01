require 'resque_web'

Rails.application.routes.draw do
  devise_for :users
  root to: 'application#index'

  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # authenticate :user do
    mount ResqueWeb::Engine => "admin/resque_web"
  # end
end
