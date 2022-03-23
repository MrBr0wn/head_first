# frozen_string_literal: true

require 'Ch_8/object_references'

RSpec.describe CelestialBody do
  subject { described_class.new }

  it "should return instance of #{described_class} class" do
    expect(subject).to be_kind_of(described_class)
  end

  it 'should be empty on initialization without arguments' do
    expect(subject.instance_variables).to be_empty
  end

  it 'should create hash' do
    bodies = Hash.new do |hash, key|
      body = described_class.new
      body.type = 'planet'
      hash[key] = body
    end
    bodies['Earth'].name = 'Earth'

    expect(bodies['Earth']).to be_kind_of(CelestialBody)
    expect(bodies['Earth'].instance_variables).not_to be_empty
    expect(bodies).to be_kind_of(Hash)
  end
end
