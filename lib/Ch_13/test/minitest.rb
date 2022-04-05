# frozen_string_literal: true

require 'minitest/autorun'

# some class
class TestSomething < Minitest::Test
  def test_true_assertion
    assert(true)
  end

  def test_false_assertion
    assert(false)
  end
end
