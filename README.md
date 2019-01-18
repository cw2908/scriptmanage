# Scriptmanage Services Boilerplate

Clone this repo to generate a new rails app preconfigured for easy Samanage integration development.


### Architecture

- Rails 5
- Postgres
- Devise
- Resque
- Redis
- React w/ Salesforce Lightning Components
- AWS (S3 file storage)
- NodeJS (use `yarn install` for webpack and node modules)
- Guard / Minitest
 
 
 #### Features
* Autogenerate new integration services boilerplate with tests
* React Frontend hooks into services
* Create react forms based on rails `FormField` class
* Can run in 'backend only' mode with only scheduled tasks via `rake service:run`
Most features are optional and only added when used.



### Adding a service

Generate new service with `rails g service <name>`
This will copy service and test templates to `lib/pservices/` `test/pservices/`


Run in Development with: `foreman start -f Procfile.dev`
Run tests with `bundle exec guard`


### Deploying to heroku

Set all required environment keys in `config/initializers/figaro.rb`
If keys are saved locally in `config/application.yml` (do not commit this file) they can be published with: `figaro heroku:set -e production`

`config/application.yml`
```yaml
test:
  REDIS_URL: redis://localhost:6379
  ACCOUNT_TOKEN: 'Sandbox-API-Token'
development:
  REDIS_URL: redis://localhost:6379
  ACCOUNT_TOKEN: 'Sandbox-API-Token'
production:
  ACCOUNT_TOKEN: 'API_TOKEN_HERE'
  ## Heroku addons set REDIS_KEY
  ## Set this only if manually configuring redis
  # REDIS_URL: ''
```
When developing locally rename the Rails application module name. Redis namespace will be prefixed by `Rails.application.class.parent_name`

* May need to set `config.assets.compile = true` for Heroku https://devcenter.heroku.com/articles/rails-asset-pipeline#compile-set-to-true-in-production (assets are precompiled by default)
