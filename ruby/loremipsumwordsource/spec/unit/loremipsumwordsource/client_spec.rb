require "spec_helper"

describe Loremipsumwordsource::Client do
  let(:client) { Loremipsumwordsource::Client.new("./spec/fixture/lorem_ipsum.txt") }
  context "#load" do
    describe "file" do
      subject { client.file }
      it { should be_a File }
      specify { subject.path.should eq "./spec/fixture/lorem_ipsum.txt" }
    end
    describe "source" do
      subject { client.source }
      it { should be_a Array }
    end
    describe "source_index" do
      subject { client.source_index }
      it { should be_a_kind_of Integer }
      it { should be 0 }
    end
  end
end