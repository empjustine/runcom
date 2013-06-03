#!/usr/bin/env rake

task :default => [:tilde_dotfiles]

def target_name(file)

  return File.open(file) { |fh| fh.readline.chomp }.split(/~\//).last
end


desc "Generate dotfiles shims"
task :tilde_dotfiles do
  Dir["#{Dir.pwd}/tilde/*"].each { |tilde|
    target  = "#{Dir.home}/#{target_name tilde}"
    ln_s tilde, target, :force => true
  }
end


desc "Run shell command expansion on every file in folder"
task :powercmd, [:cmd, :regexp, :sub, :glob] do |t, args|
  Dir["#{Dir.pwd}/#{args.glob}"].each { |file|
    puts "#{args.cmd} #{file} #{file.gsub(/#{args.regexp}/, args.sub)}"
  }
end
