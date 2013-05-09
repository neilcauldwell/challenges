begin
  
  require 'rspec'
  require 'rspec/core/rake_task'

  namespace :ci do

    desc 'Run specs'
    RSpec::Core::RakeTask.new(:spec) do |t|
    end

  end

rescue LoadError
  warn 'Rspec is not available, spec task not provided.'
end