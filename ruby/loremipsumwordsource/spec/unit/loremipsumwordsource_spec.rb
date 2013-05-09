require 'spec_helper'

describe Loremipsumwordsource do
  context 'class' do
    subject { Loremipsumwordsource }
    it { should respond_to :new }
  end
  context 'object' do
    subject { Loremipsumwordsource.new }
    it { should be_a Loremipsumwordsource::Client }
    it { should respond_to :load }
  end
  context 'with fixture' do
    it 'should look like Example' do
      src = Loremipsumwordsource::Client.new('./spec/fixture/lorem_ipsum.txt')
      src.next_word.should eq 'Lorem'
      src.next_word.should eq 'ipsum'
      src.top_5_words.should eq ['Lorem','ipsum',nil,nil,nil]
      src.top_5_consonants.should eq ['m','L','r','p','s']
    end
  end
end