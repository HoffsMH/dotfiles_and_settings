require 'pry'
require 'fileutils'
# File.expand_path('../.', __FILE__)
APP_SETTINGS = YAML.load_file('data/app_settings.yml')

APP_SETTINGS.each do |app, settings|
  puts "Installing: #{app}"
  puts "making backup"
  source      = File.expand_path(settings["source"] + settings['name'])
  destination = File.expand_path(settings["destination"])

  cp source, destination

  binding.pry
end

def attach_date()
