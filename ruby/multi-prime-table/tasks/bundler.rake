begin
  
  require 'bundler'
  Bundler::GemHelper.install_tasks

rescue LoadError
  warn 'Bundler is not available, bundler task not provided.'
end