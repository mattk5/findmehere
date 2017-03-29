source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'bcrypt', '3.1.11'
gem 'bootstrap-sass', '3.3.7'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'geokit-rails', '~> 2.2'
gem 'pry', '~> 0.10.4'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3', '1.3.12'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do 
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters', '1.1.9'  
end

group :production do 
  gem 'pg', '0.18.4'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
