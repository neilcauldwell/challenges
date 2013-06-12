require "loremipsumwordsource/client"
require "loremipsumwordsource/version"

module Loremipsumwordsource

  class << self

    # Alias for Loremipsumwordsource::Client.new
    #
    # @return [Loremipsumwordsource::Client]
    def new(source_path = nil)
      Loremipsumwordsource::Client.new(source_path)
    end

    # Delegate to Loremipsumwordsource::Client
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    # Delegate to Loremipsumwordsource::Client
    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

  end

end