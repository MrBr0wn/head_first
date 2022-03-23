# frozen_string_literal: true

require 'Ch_7/hashes'

RSpec.describe Candidate do
  subject { described_class.new('Carl Doe', age: 30, occupation: 'QA') }

  it 'should return object of Candidate class' do
    expect(subject).to be_kind_of(Candidate)
  end

  it 'should return all instance variables' do
    instance_variables = %i[@name @age @occupation @hobby @birthplace]
    expect(subject.instance_variables).to eq(instance_variables)
  end

  context 'creating object without enough arguments' do
    it 'should return ArgumentError message with only name' do
      expect { described_class.new('Test name') }.to raise_error(ArgumentError)
    end

    it 'should return ArgumentError message with only name and age' do
      expect { described_class.new('Test name', age: 10) }.to raise_error(ArgumentError)
    end
  end
end
