require "pry"
require "fileutils"

module Backup
  def self.make_backup_dir
    @backup_dir ||= FileUtils.mkdir_p(File.expand_path(".backups/" + Time.now.strftime("%Y-%m-%d--%H-%M-%S"))).first
  end

  def self.clear_backup_dir
    Dir.glob(".backups/*").each do |backup|
      FileUtils.rm_rf backup
    end
  end

  def self.backup(settings)
    make_backup_dir
    file = File.expand_path(settings["destination"] + settings['name'])
    destination = @backup_dir + "/" + settings["source"]
    FileUtils.mkdir_p destination
    FileUtils.cp file, destination
  end
end
