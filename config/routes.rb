# frozen_string_literal: true

# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#         new_user_session GET    /users/sign_in(.:format)       users/sessions#new
#             user_session POST   /users/sign_in(.:format)       users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create
#                 webhooks GET    /api/webhooks(.:format)        api/v1/webhooks#index {:format=>:json}
#                          POST   /api/webhooks(.:format)        api/v1/webhooks#create {:format=>:json}
#                 services POST   /api/services(.:format)        api/v1/services#create {:format=>:json}
#                          GET    /api/services(.:format)        api/v1/services#index {:format=>:json}
#                     root GET    /                              application#index
#               resque_web        /admin/resque_web              ResqueWeb::Engine
#
# Routes for ResqueWeb::Engine:
#             overview GET    /overview(.:format)             resque_web/overview#show
#        working_index GET    /working(.:format)              resque_web/working#index
#          clear_queue PUT    /queues/:id/clear(.:format)     resque_web/queues#clear {:id=>/[^\/]+/}
#               queues GET    /queues(.:format)               resque_web/queues#index
#                queue GET    /queues/:id(.:format)           resque_web/queues#show {:id=>/[^\/]+/}
#                      DELETE /queues/:id(.:format)           resque_web/queues#destroy {:id=>/[^\/]+/}
#              workers GET    /workers(.:format)              resque_web/workers#index
#               worker GET    /workers/:id(.:format)          resque_web/workers#show {:id=>/[^\/]+/}
#        retry_failure PUT    /failures/:id/retry(.:format)   resque_web/failures#retry
#   retry_all_failures PUT    /failures/retry_all(.:format)   resque_web/failures#retry_all
# destroy_all_failures DELETE /failures/destroy_all(.:format) resque_web/failures#destroy_all
#             failures GET    /failures(.:format)             resque_web/failures#index
#              failure GET    /failures/:id(.:format)         resque_web/failures#show
#                      DELETE /failures/:id(.:format)         resque_web/failures#destroy
#                stats GET    /stats(.:format)                resque_web/stats#index
#         stats_resque GET    /stats/resque(.:format)         resque_web/stats#resque
#          stats_redis GET    /stats/redis(.:format)          resque_web/stats#redis
#           stats_keys GET    /stats/keys(.:format)           resque_web/stats#keys
#       keys_statistic GET    /stats/keys/:id(.:format)       resque_web/stats#keys {:id=>/[^\/]+/}
#                 root GET    /                               resque_web/overview#show

require 'resque_web'

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  defaults format: :json do
    scope module: :api, defaults: { format: :json }, path: 'api' do
      scope module: :v1 do
        get '/webhooks',          to: 'webhooks#index'
        post '/webhooks',         to: 'webhooks#create'
        post '/services',         to: 'services#create'
        get '/services',          to: 'services#index'
      end
    end
  end
  root to: 'application#index'
  ## For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  authenticate :user, ->(u) { !Rails.env.production? || u.role == 'admin' } do
    mount ResqueWeb::Engine => 'admin/resque_web'
  end
end
