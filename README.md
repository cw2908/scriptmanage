# Scriptmanage Hosted Scripts Template


### Architecture

- Rails 5 / Ruby 2.4.2

- NodeJS (use `yarn install` for webpack and node modules)
 


### To Develop

Generate new service with `rails g service <name>`
This will copy service and test templates to `lib/pservices/` `test/pservices/`


Run in Development with: `foreman start -f Procfile.dev`
Run tests with `bundle exec guard`


### To Deploy

Set all required environment keys from `config/initializers/figaro.rb`
If keys are saved locally in `config/application.yml` (do not commit this file) they can be published with: `figaro heroku:set -e production`