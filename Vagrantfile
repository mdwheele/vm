require 'yaml'
require_relative 'scripts/hash'
require_relative 'scripts/kraken'

settingsPath = File.join(File.dirname(__FILE__), "config.dist.yaml")

Vagrant.configure("2") do |config|
    Kraken.release(config, YAML.load_file(settingsPath))
end