require 'pry'
require 'fileutils'
require 'lib/backup'
# File.expand_path('../.', __FILE__)
# APP_SETTINGS = YAML.load_file('data/app_settings.yml')

module Install
  module AppSettings
    def self.install(app_settings)
      app_settings.each do |app, settings|
        puts "making backup of #{app}"
        Backup.backup(settings)

        puts "Installing: #{app}"
        source      = File.expand_path(settings["source"] + settings['name'])
        destination = File.expand_path(settings["destination"] + settings['name'])

        FileUtils.cp source, destination
      end
    end
  end
end
