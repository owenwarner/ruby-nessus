$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__),'..','lib'))

#!/usr/bin/env ruby

require 'rubygems'
require 'ruby-nessus'


Nessus::XML.new("1.nessus") do |scan|

  puts scan.high_severity_count
  puts scan.medium_severity_count
  puts scan.low_severity_count
  puts scan.informational_severity_count
  puts scan.total_event_count
  puts scan.hosts.count

  scan.hosts do |host|
    next if host.event_count.zero?
    puts host.hostname
    puts host.event_count

    host.events do |event|
      next if !event.severity.low?
      # puts event.name if event.name
      puts event.port.protocol
      # puts event.severity.in_words
      # puts event.plugin_id
      # puts event.data
    end

  end
end