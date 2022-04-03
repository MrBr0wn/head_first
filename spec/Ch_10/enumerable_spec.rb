# frozen_string_literal: true

require 'Ch_10/enumerable'

RSpec.describe WordSplitter do
  subject { described_class.new }

  context 'methods' do
    it 'shoud have enumerable method #each' do
      subject.string = 'test string for this method'
      expect(subject.each).to be_an_instance_of(Enumerator)
    end
  end

  context 'Enumerable module' do
    it 'should be included' do
      expect(described_class.included_modules.include?(Enumerable)).to be true
    end

    it 'should have other methods, ex. #count' do
      subject.string = 'test string for this method'

      expect(subject.count).to eq(5)
    end
  end
end
