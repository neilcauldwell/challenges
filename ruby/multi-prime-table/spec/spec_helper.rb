#
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
end

require "thor"
require "thor/group"
load "./lib/multi-prime-table.thor"
require "awesome_print"
require "pry"