# frozen_string_literal: true

require 'Ch_5/arrays_and_blocks'

RSpec.describe 'Blocks' do
  let(:arr) { [5.5, 25.0, 38.3, 10.0, 2.1] }

  it 'should return sum of array' do
    expect(total(arr)).to eq(arr.sum)
  end

  it 'should return refund of array' do
    expect(refund(arr)).to eq(arr.reduce(0, :-))
  end

  it 'should return discount value' do
    result = arr.map { |item| (item / 3.0).round(2) }

    expect { show_discounts(arr) }.to output(include("Your discount: $#{result[0]}")).to_stdout
  end
end
