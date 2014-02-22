require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'Kanazawarb_slides'

desc 'collect kanazawa.rb slide urls'
task :collect do
  output = File.open("presentations.txt", "w")
  output.puts KanazawarbSlides.collect
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
