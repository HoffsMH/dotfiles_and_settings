module Install
  module Run
    def self.install(command_list)
      return if abort?
      command_statuses = command_list.map do |command|
        puts "about to run"
      end
    end

    def self.abort?
      puts
      print 'This part of the process will run commands It is'
      puts ' recomended you review data/commands.yml before proceeding.'
      puts
      puts 'Proceed? [y/n] '
      thing = STDIN.gets.chomp
      thing == 'y'
    end
  end
end
