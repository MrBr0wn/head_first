# frozen_string_literal: true

require 'Ch_12/exceptions'

RSpec.describe SmallOvent do
  subject { described_class.new }

  context 'methods list' do
    it 'should have #methods' do
      methods_list = %i[turn_on turn_off bake]
      instance_methods_list = described_class.instance_methods.select { |method| methods_list.include?(method) }
      expect(instance_methods_list).to match_array methods_list
    end
  end

  context 'exceptions' do
    it 'should be StandardError child' do
      expect(OvenOffError.superclass).to eq(StandardError)
      expect(OvenEmptyError.superclass).to eq(StandardError)
    end

    it 'should be OvenOffError and have message' do
      expect do
        subject.bake
      end.to raise_error(be_an_instance_of(OvenOffError).and(having_attributes({ 'message' => 'You need to turn the oven on first!' })))
    end

    it 'should return exception of OvenOffError class' do
      expect { subject.bake }.to raise_error(OvenOffError, 'You need to turn the oven on first!')
    end

    it 'should return exepction of OvenEmptyError class' do
      subject.turn_on
      expect { subject.bake }.to raise_error(OvenEmptyError, "There's nothing in the oven!")
    end
  end
end
