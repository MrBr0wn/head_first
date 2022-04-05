# frozen_string_literal: true

require 'minitest/autorun'
require './lib/list_with_commas'

# class TestListWithCommas
class TestListWithCommas < Minitest::Test
  def setup
    @list = ListWithCommas.new
  end

  def test_it_joins_two_words_with_and
    @list.items = %w[apple orange]
    assert('apple and orange' == @list.join)
  end

  def test_it_joins_three_words_with_commas
    @list.items = %w[apple orange pear]
    assert('apple, orange, and pear' == @list.join)
  end

  def test_it_joins_one_word_alone
    @list.items = %w[apple]
    assert_equal('apple', @list.join)
  end
end
