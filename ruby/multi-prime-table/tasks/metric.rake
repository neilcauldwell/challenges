desc 'Default: run quality'
task :default => ['metric:quality']

desc 'Run metric suite'
task :metric => ['metric:quality']