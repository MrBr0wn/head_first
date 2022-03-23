# frozen_string_literal: true

require 'Ch_7/votes'

RSpec.describe 'Counting the results of voting' do
  context 'checking file' do
    let(:path) { "#{Dir.pwd}/lib/Ch_7/votes.txt" }
    it 'result file votes.txt should be exist' do
      expect(File.exist?(path)).to be true
    end

    it 'should return true if file not empty' do
      file = File.open(path).read
      expect(file.empty?).not_to be true
    end
  end

  it 'should output names' do
    expect { puts '{"amber graham"=>5, "brian martin"=>4}' }.to output.to_stdout
  end
end
