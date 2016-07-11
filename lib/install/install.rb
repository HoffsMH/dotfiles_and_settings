require 'fileutils'

module Install
  def self.install_all(manifest)
    manifest.each do |app, settings|
      install(app, settings)
    end
  end

  def self.install(app, settings)
    Logger.l("----------------")
    Logger.l("App: #{app}")
    source      = File.expand_path(settings["source"] + settings['name'])
    destination = File.expand_path(settings["destination"] + settings['name'])

    Logger.l("Making a backup of #{app} from #{destination}")
    Backup.backup(settings)

    Logger.l("Installing: #{app} in #{destination}")

    FileUtils.cp source, destination
  end
end
