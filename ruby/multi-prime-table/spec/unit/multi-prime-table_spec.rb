require 'spec_helper'

describe Multi::Prime::Table do
  let(:thor) { Multi::Prime::Table.new }
  context 'class' do
    subject { Multi::Prime::Table }
    it { should respond_to :new }
  end
  context 'object' do
    subject { thor }
    it { should be_a Multi::Prime::Table::Run }
    it { should respond_to :generate_table }
  end
end