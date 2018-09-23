source 'https://rubygems.org'

gem "chef", path: "."

gem 'berkshelf'


group :unit do

  gem 'chef-sugar', '= 2.0.0'
  # hardcode the version for now until 404s are resolved:
  # https://github.com/sethvargo/chefspec/issues/472
  gem 'chef-zero', '= 2.0.2'
end

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.5.2"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

gem 'test-kitchen'
gem 'kitchen-vagrant'
gem 'foodcritic'
gem 'rubocop'
gem 'rspec'
gem 'chef-sugar', '= 2.0.0'
