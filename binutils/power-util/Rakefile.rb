#!/usr/bin/env rake

task :default => [:shims]

SYSTEMD_TARGETS = %w(halt hybrid-sleep poweroff reboot suspend)

desc "Generate the power-util shims"
task :shims do
  SYSTEMD_TARGETS.each { |shim|
    ln_s "power-util-shim", "bin/#{shim}", :force => true
  }
end
