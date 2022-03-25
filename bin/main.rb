#!/usr/bin/env ruby
require_relative '../lib/ship'
require_relative '../lib/planet'

class Main
  def initialize(ship_mass, flight_route_info)
    @flight_route_info = flight_route_info
    @ship = nil
    @total_fuel_needed = 0
    create_ship(ship_mass)
    start_journey
  end

  def start_calculation
    p "flight info: #{@flight_route_info}"
    p 'Calculation is done!'
  end

  def create_ship(ship_mass)
    @ship = Ship.new(ship_mass)
    @planet = Planet.new(9.807)
    p @ship.mass
  end

  def start_journey
    @flight_route_info.reverse!
    # operation_mass = 0
    @flight_route_info.each do |flight|

      # my trial starts
      # p "operation_mass: #{operation_mass}"
      @total_fuel_needed += @ship.operate(@ship.mass + @total_fuel_needed, flight)

      # my trial ends

      # p "flight type: #{flight[0]}"
      # current_fuel = @ship.operate(flight)
      # p "fuel for current operation: #{current_fuel}"
      # p "----"
    end
    # p @ship.calculate_fuel_for_landing(@ship.mass, 9.807)

    # if @ship.is_in_air
    #
    # end
    p "total: #{@total_fuel_needed}"
  end
end

Main.new(
  75432,
  [
    [:launch, 9.807],
    [:land, 1.62],
    [:launch, 1.62],
    [:land, 3.711],
    [:launch, 3.711],
    [:land, 9.807]
  ]
)

# Main.new(
#   14606, [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]]
# )
