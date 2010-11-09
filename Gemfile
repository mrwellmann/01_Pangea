source "http://rubygems.org"
source "http://gemcutter.org"

  gem 'warden', 	"~> 0.10.3"
  gem 'devise', 	"~> 1.0.6"
  gem 'rack', 	"~> 1.0.1"
  gem 'rails', 	"~> 2.3.5" 
  gem 'inherited_resources', "~> 1.0.6"
  
group :production, :staging do
  gem "pg"
end

group :development, :test do
  gem "sqlite3-ruby", "~>1.2.5", :require => "sqlite3"
end

# bundler requires these gems in all environments


group :test do
  gem 'machinist', "~> 1.0.6"
  gem 'faker', 	"~> 0.3.1"
  gem 'webrat', 	"~> 0.7.1"
  gem 'ruby-prof', "= 0.8.1"
  gem 'shoulda', 	"~> 2.10.3"
end

