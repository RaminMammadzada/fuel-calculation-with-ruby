#!/usr/bin/env ruby
require_relative '../lib/ship'
require_relative '../lib/planet'

class Main
  def initialize(ship_mass, flight_info)
    @flight_info = flight_info
    @ship = nil
    start_calculation
    create_ship(ship_mass)
  end

  def start_calculation
    p "flight info: #{@flight_info}"
    p 'Calculation is done!'
  end

  def create_ship(ship_mass)
    @ship = Ship.new(ship_mass)
    @planet = Planet.new(9.807)
    p @ship.mass
  end
end

Main.new(28_801, [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]])
