# frozen_string_literal: true

require 'Ch_10/comparable'

RSpec.describe Steak do
  subject { described_class.new }

  context 'GRADE_SCORES constant' do
    it 'should have GRADE_SCORES constant' do
      expect(described_class.constants).to eq([:GRADE_SCORES])
    end

    it 'should be Hash' do
      expect(described_class::GRADE_SCORES).to be_an_instance_of(Hash)
    end
  end

  context 'methods' do
    it 'shoud have comparable method #<=>' do
      subject.grade = 'Prime'

      other_obj = described_class.new
      other_obj.grade = 'Choice'
      expect(subject.<=>(other_obj)).to eq(1)
      expect(subject.<=>(other_obj)).not_to eq(0)
      expect(subject.<=>(other_obj)).not_to eq(-1)
    end
  end

  context 'Comparable module' do
    it 'should be included' do
      expect(described_class.included_modules.include?(Comparable)).to be true
    end

    it 'should have other methods, ex. <' do
      subject.grade = 'Prime'

      other_obj = described_class.new
      other_obj.grade = 'Choice'
      expect(subject < other_obj).to be false
    end
  end
end
