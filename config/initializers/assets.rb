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


# 個別　SCSSを読み込ませる処理
# users
Rails.application.config.assets.precompile += %w( users/admin_index.scss )
Rails.application.config.assets.precompile += %w( users/admin_edit.scss )
Rails.application.config.assets.precompile += %w( users/admin_show.scss )
Rails.application.config.assets.precompile += %w( users/contact.scss )
Rails.application.config.assets.precompile += %w( users/edit.scss )
Rails.application.config.assets.precompile += %w( users/privacy.scss )
Rails.application.config.assets.precompile += %w( users/registrations/new.scss )
Rails.application.config.assets.precompile += %w( users/sessions/new.scss )
Rails.application.config.assets.precompile += %w( users/show_likes.scss )
Rails.application.config.assets.precompile += %w( users/show_comments.scss )
Rails.application.config.assets.precompile += %w( users/service.scss )

# administrators
Rails.application.config.assets.precompile += %w( administrators/registrations/new.scss )
Rails.application.config.assets.precompile += %w( administrators/sessions/new.scss )

# spots
Rails.application.config.assets.precompile += %w( spots/admin_index.scss )
Rails.application.config.assets.precompile += %w( spots/admin_edit.scss )
Rails.application.config.assets.precompile += %w( spots/admin_new.scss )
Rails.application.config.assets.precompile += %w( spots/admin_show.scss )
Rails.application.config.assets.precompile += %w( spots/edit.scss )
Rails.application.config.assets.precompile += %w( spots/index.scss )
Rails.application.config.assets.precompile += %w( spots/new.scss )
Rails.application.config.assets.precompile += %w( spots/show.scss )
Rails.application.config.assets.precompile += %w( spots/top.scss )


# like_comments
Rails.application.config.assets.precompile += %w( like_comments/admin_index.scss )
Rails.application.config.assets.precompile += %w( like_comments/edit.scss )
Rails.application.config.assets.precompile += %w( like_comments/index.scss )
Rails.application.config.assets.precompile += %w( like_comments/new.scss )


# 個別　JavaScriptを読み込ませる処理
# spots
Rails.application.config.assets.precompile += %w( spots/map.js )
Rails.application.config.assets.precompile += %w( spots/jquery.bgswitcher.js )
Rails.application.config.assets.precompile += %w( places.js.coffee )

# users
Rails.application.config.assets.precompile += %w( users/registrations/new.js )

# 全体
Rails.application.config.assets.precompile += %w( custom.scss )


