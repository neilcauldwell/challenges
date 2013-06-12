module Loremipsumwordsource

  module Words

    # Based on the current source_index, return the next word
    #
    # @return [String]
    def next_word

      # grab the next word
      nw = self.source[self.source_index]

      # record the word as seen
      record_word(nw, self.source_index)

      # increment the index to keep track of where we're at
      # unless we're at the length of the source ( end )
      self.source_index = self.source_index + 1 unless self.source_index == ( self.source.length - 1 )

      # return our next_word
      return nw

    end

    # Based on the current source_index, return the previous word
    #
    # @return [String]
    def prev_word

      # increment the index to keep track of where we're at
      # unless we're at zero
      self.source_index = self.source_index - 1 unless self.source_index == 0

      # grab the next word
      pw = self.source[self.source_index]

      # record the word as seen
      record_word(pw, self.source_index)

      # return our prev_word
      return pw

    end

    # Return top 5 words
    #
    # @return [Array]
    def top_5_words

      # filter out non-unique entities
      # add a :count to be able to sort by
      words = self.seen_words.uniq.each do |elem|
        elem.delete(:index)
        elem.merge!(:count => self.seen_words.count(elem))
      end

      # sort by :count, desc
      words.sort_by! { |x| -x[:count] }

      # return only the words
      words = words.uniq.map! {|x| x[:word] }

      # make sure we return at least 5 words everytime ( nil if missing )
      while words.length < 5
        words << nil
      end

      # return only 5
      return words.last(5)

    end

    # Return top 5 consonants
    #
    # @return [Array]
    def top_5_consonants

      #
      consonants = []

      # filter out non-unique entities
      # only keep words with consonants in them
      words_with_consonants = self.seen_words.uniq.keep_if do |elem|
        elem.delete(:index)
        elem[:word] =~ /[^aeiou]/i
      end

      # for the remaing words remove only consonants
      # split them ( incase a word has multiple consonants )
      # add them to
      words_with_consonants.each do |elem|
        elem[:word].gsub(/[aeiou]/i,"").split("").each do |consonant|
          consonants << { :consonant => consonant }
        end
      end

      # add a :count to be able to sort by
      # filter again by uniq
      consonants = consonants.uniq.each do |elem|
        elem.merge!(:count => consonants.count(elem))
      end

      # sort by :count, desc
      consonants.sort_by! { |x| -x[:count] }

      # return only the consonants
      consonants = consonants.uniq.map! {|x| x[:consonant] }

      # make sure we return at least 5 consonants everytime ( nil if missing )
      while consonants.length < 5
        consonants << nil
      end

      # return only 5
      return consonants.last(5)

    end

    # Record a 'seen' word, to be used for calculating top 5 words / consonants
    #
    # @param word [String] the word that has been seen
    # @param index [Integer] the index position of the word in the source
    def record_word(word, index)
      self.seen_words << { :word => word, :index => index }
    end

  end

end