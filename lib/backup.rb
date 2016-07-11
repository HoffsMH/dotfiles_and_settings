require "pry"
require "fileutils"

module Backup
  def self.make_backup_dir
    Logger.l("Making new backup Directory") if !@backup_dir
    @backup_dir ||= FileUtils.mkdir_p(File.expand_path(".backups/" + Time.now.strftime("%Y-%m-%d--%H-%M-%S"))).first
  end

  def self.clear_backup_dir
    Logger.l("This action is destructive. Do you wish to continue? [y/n]")
    input = STDIN.gets.chomp
    if input == 'y'
      Logger.l("Deleting all backups")
      Dir.glob(".backups/*").each do |backup|
        FileUtils.rm_rf backup
      end
    else
      Logger.l("Aborted.")
    end
  end

  def self.backup(settings)
    make_backup_dir
    file = File.expand_path(settings["destination"] + settings['name'])
    if File.file?(file)
      Logger.l("Backing up File #{file}")
      backup_path = @backup_dir + "/" + settings["source"]
      FileUtils.mkdir_p backup_path
      FileUtils.cp file, backup_path
    else
      Logger.l("File(#{file}) Not found at Destination, nothing to back up!")
    end
  end

  def self.backup_all(manifest)
    manifest.each do |_, settings|
      backup(settings)
    end
    @backup_dir
  end

  def self.restore(backup_dir, manifest)
    manifest.each do |_, settings|
      backup_settings(backup_dir, settings)
    end
  end

  def self.backup_settings(backup_dir, settings)
    settings["source"] = backup_dir + "/"
    settings
  end
end
