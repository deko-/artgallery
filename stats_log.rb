#!/usr/bin/env ruby
require 'rubygems'
require 'hirb'

# parse MERB and/or Rails log files (2.3.8 or 3)
file = ARGV.first
exit unless File.exists?(file)

actions = {}
controller = nil
action = nil
format = nil

# parse log
File.open(file, 'r') do |f|
  while line = f.gets
    # match lines that start with Params:
    if matches = line.match(/\s\sParameters:\s(\{.+\})/) and not controller and not action
      params = eval(matches[1].gsub(/=>#<[^\>]+>/, '=>""'))
      controller = params['controller']
      action = params['action'] || 'index'

    elsif matches = line.match(/\s\sProcessing\sby\s(.+)#(.+)\sas\s/) and not controller and not action
    # match lines that start with Processing....
      controller = matches[1].gsub(/Controller/, '').downcase
      action = matches[2]

    # match lines that end with ~ {}
    elsif matches = line.match(/~\sParams:\s(.+)/) and not controller and not action
      params = eval(matches[1].gsub(/=>#<[^\>]+>/, '=>""'))

      controller = params['controller']
      action = params['action']

    # match lines that end with ~ {}
    elsif matches = line.match(/~\s(\{:.+\})/) and controller and action
      params = eval(matches[1].gsub(/=>#<[^\>]+>/, '=>""'))

      actions[controller] ||= {}
      actions[controller][action] ||= { :count => 0, :before_filter_time => 0, :after_filter_time => 0, :action_time => 0 }

      actions[controller][action][:count] += 1
      actions[controller][action][:before_filter_time] += params[:before_filters_time].to_f
      actions[controller][action][:after_filter_time] += params[:after_filters_time].to_f
      actions[controller][action][:action_time] += params[:action_time].to_f

      action = nil
      controller = nil

    elsif matches = line.match(/Completed.+in\s([0-9\.]+)ms/) and controller and action
      actions[controller] ||= {}
      actions[controller][action] ||= { :count => 0, :action_time => 0 }

      actions[controller][action][:count] += 1
      actions[controller][action][:action_time] += (matches[1].to_f / 1000.0)

      action = nil
      controller = nil
    end
  end
end

# put in a nice table
table = []

actions.each do |controller, controller_results|
  controller_results.each do |action, action_results|
    table << [controller, action, action_results[:count], action_results[:action_time], action_results[:action_time] / action_results[:count].to_f]
  end
end

# now sort
table.sort! { |a, b| b.last <=> a.last }

puts Hirb::Helpers::Table.render(table, :headers => ['controller', 'action', 'requests', 'total time', 'avg time'])