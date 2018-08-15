# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


# ページごとに指定したSCSSのみを読み込ませる処理
# users
Rails.application.config.assets.precompile += %w( users/registrations/new.scss )
Rails.application.config.assets.precompile += %w( users/sessions/new.scss )
Rails.application.config.assets.precompile += %w( users/show.scss )
Rails.application.config.assets.precompile += %w( users/edit.scss )

# spots
Rails.application.config.assets.precompile += %w( spots/top.scss )
Rails.application.config.assets.precompile += %w( spots/new.scss )
Rails.application.config.assets.precompile += %w( spots/edit.scss )
Rails.application.config.assets.precompile += %w( spots/show.scss )
Rails.application.config.assets.precompile += %w( spots/index.scss )

# like_comments
Rails.application.config.assets.precompile += %w( like_comments/new.scss )
Rails.application.config.assets.precompile += %w( like_comments/edit.scss )
Rails.application.config.assets.precompile += %w( like_comments/index.scss )


# ページごとに指定したJSのみを読み込ませる処理
# spots
Rails.application.config.assets.precompile += %w( spots/raty.js )

# users
Rails.application.config.assets.precompile += %w( users/registrations/new.js )

