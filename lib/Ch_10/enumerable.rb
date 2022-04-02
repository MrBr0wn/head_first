# frozen_string_literal: true

# class word splitter
class WordSplitter
  include Enumerable

  attr_accessor :string

  def each(&block)
    string.split(' ').each(&block)
  end
end

splitter = WordSplitter.new
splitter.string = 'how do you do'

p splitter.find_all { |word| word.include?('d') }
p splitter.reject { |word| word.include?('d') }
p splitter.map { |word| word.reverse }

p splitter.any? { |word| word.include?('e') }
p splitter.count
p splitter.first
p splitter.sort
