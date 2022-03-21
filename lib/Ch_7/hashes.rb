# frozen_string_literal: true

# class Candidate
class Candidate
  attr_accessor :name, :age, :occupation, :hobby, :birthplace

  def initialize(name, age:, occupation:, hobby: nil, birthplace: 'Sleepy Creek')
    self.name = name
    self.age = age
    @occupation = occupation
    @hobby = hobby
    @birthplace = birthplace
  end
end

p Candidate.new('Carl Barnes', age: 49, occupation: 'Attorney')

# p Candidate.new('Carl Barnes')
# => ArgumentError, missing keywords: :age, :occupation
