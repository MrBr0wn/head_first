# frozen_string_literal: true

require 'Ch_6/block_result'

RSpec.describe 'Finding adjectives' do
  context 'checking file' do
    let(:path) { "#{Dir.pwd}/lib/Ch_6/reviews.txt" }
    it 'should return true if reviews.txt exist in directory' do
      expect(File.exist?(path)).to be true
    end

    it 'should return true if file not empty' do
      file = File.open(path).read
      expect(file.empty?).not_to be true
    end
  end

  context '#find_adjective' do
    it 'should return capitalize adjectives' do
      adjectives = ['is amazing', 'is funny', 'is scary', 'is useful', 'is cute']
      result = adjectives.map { |string| find_adjective(string) }
      expect(adjectives.join(', ')).to include(result.sample)
    end
  end
end
