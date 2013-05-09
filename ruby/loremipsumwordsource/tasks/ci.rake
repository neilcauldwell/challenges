desc 'Default: run spec'
task :default => ['ci:spec']

desc 'Run CI suite'
task :ci => ['ci:spec']

desc 'Alias for CI spec'
task :spec => ['ci:spec']