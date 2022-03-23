# frozen_string_literal: true

# class CelestialBody
class CelestialBody
  attr_accessor :name, :type
  attr_reader :result

  bodies = Hash.new do |hash, key|
    body = CelestialBody.new
    body.type = 'planet'
    hash[key] = body
  end

  bodies['Mars'].name = 'Mars'
  bodies['Europa'].name = 'Europa'
  bodies['Europa'].type = 'moon'
  bodies['Venus'].name = 'Venus'

  # bodies.each { |item| p item }
end
