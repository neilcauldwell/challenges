begin

  require 'yard'

  desc 'Generate documentation'
  YARD::Rake::YardocTask.new do |task|
    task.files   = ['README.md', 'LICENSE.md', 'lib/**/*.rb']
    task.options = [
      '--output-dir', 'doc/yard',
      '--markup', 'markdown',
    ]
  end

rescue LoadError
  warn 'Yard is not available, yard task not provided.'
end