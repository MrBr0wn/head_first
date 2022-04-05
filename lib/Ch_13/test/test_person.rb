# frozen_string_literal: true

require 'minitest/autorun'
require './lib/some_person'

# minitest class
class TestPerson < Minitest::Test
  def test_introduction
    person = SomePerson.new
    person.name = 'Bob'
    assert(person.introduction == 'Hello, my name is Bob!')
  end
end
