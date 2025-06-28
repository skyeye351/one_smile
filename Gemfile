source "https://rubygems.org"

gem "rails", "~> 7.2.1"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "jsbundling-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

group :development, :test do
  # デバッグ・診断
  gem "pry-byebug"
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false

  # Lint・コード品質
  gem "rubocop-rails-omakase", require: false

  # テスト支援
  gem "faker"
  gem "factory_bot_rails"
  gem "rspec-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

gem "tailwindcss-rails"
gem "tailwindcss-ruby", "3.4.17"

gem "sorcery"

gem "rails-i18n"

gem "draper"

# gem "carrierwave" # ファイルアップローダー機能

gem "slim-rails"
gem "html2slim"

gem "cloudinary" # renderで画像保管