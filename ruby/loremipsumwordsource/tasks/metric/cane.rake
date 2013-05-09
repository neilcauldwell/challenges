begin

  require 'cane/rake_task'

  namespace :metric do
  
    desc 'Analyze for code quality'
    Cane::RakeTask.new(:quality) do |cane|
      cane.abc_max = 15
      cane.no_doc = true
      cane.style_measure = 200
    end

  end

rescue LoadError
  warn 'Cane is not available, quality task not provided.'
end