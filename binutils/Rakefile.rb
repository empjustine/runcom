#!/usr/bin/env rake

task :default => [:recursive, :shims]

desc "Generate shims"
task :shims do
  mkdir_p "#{Dir.home}/bin"
  Dir["#{Dir.pwd}/*/bin/*"].each { |bin|
    ln_s bin, "#{Dir.home}/bin/", :force => true
  }
end

task :recursive do
  Dir['**/*/Rakefile.rb'].each { |rakefile|
    sh "cd \"#{rakefile.gsub '/Rakefile.rb', ''}\" && rake"
  }
end