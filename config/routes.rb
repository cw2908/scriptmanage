require 'resque/server'

Rails.application.routes.draw do
  # get 'hello_world', to: 'hello_world#index'
  mount Resque::Server.new, :at => "/resque"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
