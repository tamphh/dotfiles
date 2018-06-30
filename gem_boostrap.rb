require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'tmuxinator', '~> 0.11.3', :require => false
end

puts 'Gems installed and loaded!'
