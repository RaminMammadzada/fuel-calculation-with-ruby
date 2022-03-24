require_relative './constants'

class Planet
  attr_reader :gravity, :name

  def initialize(gravity)
    @gravity = gravity
    @name = nil
    call_planet
  end

  def call_planet
    @name = planet_gravity_map[9.807]
  end
end
