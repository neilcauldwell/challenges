require 'spec_helper'

describe Loremipsumwordsource::Words do
  let(:client) { Loremipsumwordsource::Client.new('./spec/fixture/lorem_ipsum.txt') }
  context '#next_word' do
    it 'should return the words in the right order' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['x','y','z']
      @client.next_word.should eq 'x'
      @client.next_word.should eq 'y'
      @client.next_word.should eq 'z'
    end
    it 'should prevent reaching an index beyond the sources total length' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['x','y','z']
      @client.next_word.should eq 'x'
      @client.next_word.should eq 'y'
      @client.next_word.should eq 'z'
      @client.next_word.should eq 'z'
    end
  end
  context '#prev_word' do
    it 'should return the words in the right order' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['a','b','c']
      @client.next_word.should eq 'a'
      @client.next_word.should eq 'b'
      @client.prev_word.should eq 'b'
      @client.prev_word.should eq 'a'
    end
    it 'should prevent reaching an index beyond the sources start length' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['x','y','z']
      @client.prev_word.should eq 'x'
      @client.prev_word.should eq 'x'
    end
  end
  context '#top_5_words' do
    it 'should return the top 5 words seen by count' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['e','b','c','d','e']
      5.times do
        @client.next_word
      end
      @client.top_5_words.should eq ['e','b','c','d',nil]
    end
    it 'replaces missing words with nil when less then 5' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['a','b','c','d','e']
      3.times do
        @client.next_word
      end
      @client.top_5_words.should eq ['a','b','c',nil,nil]
    end
    it 'limits to only 5' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['a','b','c','d','e','f','g','h','i','j']
      10.times do
        @client.next_word
      end
      @client.top_5_words.should eq ['f','g','h','i','j']
    end
  end
  context '#top_5_consonants' do
    it 'should return the top 5 consonants seen' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['a','d','b','c','g','h']
      6.times do
        @client.next_word
      end
      @client.top_5_consonants.should eq ['d','b','c','g','h']
    end
    it 'should return the top 5 consonants seen by count' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['err','bar','bee','bar','bar']
      5.times do
        @client.next_word
      end
      @client.top_5_consonants.should eq ['r','b',nil,nil,nil]
    end
    it 'limits to only 5' do
      @client = Loremipsumwordsource::Client.new
      @client.source = ['a','d','b','c','g','h','f','j','k','l']
      10.times do
        @client.next_word
      end
      @client.top_5_words.should eq ['h','f','j','k','l']
    end
  end
end