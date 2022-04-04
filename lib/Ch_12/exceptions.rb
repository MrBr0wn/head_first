# frozen_string_literal: true

# custom error class
class OvenOffError < StandardError
end

# custom error class
class OvenEmptyError < StandardError
end

# class small oven
class SmallOvent
  attr_accessor :contents

  def turn_on
    puts 'Turning oven on.'
    @state = 'on'
  end

  def turn_off
    puts 'Turning oven off.'
    @state = 'off'
  end

  def bake
    raise OvenOffError, 'You need to turn the oven on first!' unless @state == 'on'
    raise OvenEmptyError, "There's nothing in the oven!" if @contents.nil?

    "golden-brown #{contents}"
  end
end

dinner = ['turkey', nil, 'pie']
oven = SmallOvent.new
oven.turn_off
dinner.each do |item|
  oven.contents = item
  puts "Serving #{oven.bake}."
rescue OvenEmptyError => e
  puts "Error: #{e.message}"
rescue OvenOffError => e
  oven.turn_on
  retry
ensure
  oven.turn_off

  # include ensure case
  # for always turning off oven
  #
  # begin
  #   oven.turn_on
  #   oven.contents = nil
  #   puts "Serving #{oven.bake}."
  # rescue OvenEmptyError => error
  #   puts "Error: #{error.message}"
  # ensure
  #   oven.turn_off
  # end
end
