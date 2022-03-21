# frozen_string_literal: true

lines = []

path = File.dirname(__FILE__)
File.open("#{path}/votes.txt") do |file|
  lines = file.readlines
end

votes = Hash.new(0)

lines.each do |line|
  name = line.chomp
  name.downcase!
  votes[name] += 1
end

p votes
