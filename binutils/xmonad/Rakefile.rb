#!/usr/bin/env rake

task :default => [:shims]

def yesno(msg)
  while true
    print "\n#{msg} (y/n)?"
    response = STDIN.gets.chomp
    case response
    when 'y'
      return true
    when 'n'
      return false
    end
  end
end

desc "Generate shims"
task :shims do
  autostart_folder = "#{ENV['XDG_CONFIG_HOME']}/autostart/"
  mkdir_p autostart_folder
  Dir["#{Dir.pwd}/autostart.conf/**/*.desktop"].each { |autostart_file|
    if yesno(autostart_file.split('/autostart.conf/')[1])
       ln_s autostart_file, autostart_folder, :force => true
    end
  }
end
