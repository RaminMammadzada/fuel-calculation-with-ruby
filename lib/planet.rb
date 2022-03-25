# require_relative 'constants'

class Planet
  attr_reader :gravity, :name

  def initialize(gravity)
    @gravity = gravity
    @name = nil
    call_planet
  end

  def call_planet
    planet_gravity_map = Hash[
      9.807 => 'Earth',
      3.711 => 'Moon',
      1.62 => 'Mars'
    ]
    @name = planet_gravity_map[9.807]
  end
end
