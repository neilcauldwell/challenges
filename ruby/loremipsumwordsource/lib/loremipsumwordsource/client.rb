require "loremipsumwordsource/words"

module Loremipsumwordsource

  class Client

    attr_accessor :file, :source, :source_index, :seen_words

    # Initializes a new Client object
    #
    # @param source_path [Hash]
    # @return [Loremipsumwordsource::Client]
    def initialize(source_path = nil)
      self.source_index = 0
      self.seen_words = []
      load(source_path) if source_path
    end

    # Load the file's content as the basis for the word source
    #
    # @param source_path [String] a path to source, used by the WordSource
    def load(source_path)
      self.file = File.new(source_path, "rb")
      self.source = File.open(file.path, "rb") { |f| f.read.split(",") }
    end

    #
    include Loremipsumwordsource::Words

  end

end