require 'yaml'
require_relative 'scripts/hash'
require_relative 'scripts/kraken'

yaml_config = YAML.load_file('config.dist.yaml')

if File.exist?('config.yaml')
    yaml_config.merge! YAML.load_file('config.yaml')
end

Vagrant.configure("2") do |config|
    Kraken.new(config, yaml_config)
end