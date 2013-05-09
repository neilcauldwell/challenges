require 'multi-prime-table/version'
require 'multi-prime-table/run'

module Multi
  module Prime
    module Table
      class << self

        # Alias for Multi::Prime::Table::Run.new
        #
        # @return [Multi::Prime::Table::Run]
        def new
          Multi::Prime::Table::Run.new
        end

        # Delegate to Multi::Prime::Table::Run
        def method_missing(method, *args, &block)
          return super unless new.respond_to?(method)
          new.send(method, *args, &block)
        end

        # Delegate to Multi::Prime::Table::Run
        def respond_to?(method, include_private=false)
          new.respond_to?(method, include_private) || super(method, include_private)
        end

      end
    end
  end
end
