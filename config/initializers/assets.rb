# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.paths <<  Rails.root.join('assets','icons')
Rails.application.config.assets.paths <<  Rails.root.join('assets','icons','utility-sprite')
Rails.application.config.assets.paths <<  Rails.root.join('assets','icons','utility-sprite','svg')
Rails.application.config.assets.paths <<  Rails.root.join('app','assets','icons')
Rails.application.config.assets.paths <<  Rails.root.join('app','assets','icons','utility-sprite')
Rails.application.config.assets.paths <<  Rails.root.join('app','assets','icons','utility-sprite','svg')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( salesforce-lightning-design-system.css )
Rails.application.config.assets.precompile += %w( .svg )
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
