#!/usr/bin/env ruby
require_relative '../lib/ship'
require_relative '../lib/planet'

class Main
  def initialize(ship_mass, flight_route_info)
    @flight_route_info = flight_route_info
    @ship = nil
    @total_fuel_needed = 0
    inform_user
    create_ship(ship_mass)
    start_journey
  end

  def inform_user
    print 'Three.... '
    sleep 1
    print 'Two.... '
    sleep 1
    print 'One....'
    sleep 1
    puts ''
    @flight_route_info.each do |flight|
      current_planet = Planet.new(flight[1])
      p "The space shuttle is #{flight[0]}ing #{flight[0].to_s == 'launch' ? 'from' : 'to'} #{current_planet.name}!"
      sleep 1
    end

    p 'The journey is finished! '
  end

  def create_ship(ship_mass)
    @ship = Ship.new(ship_mass)
  end

  def start_journey
    @flight_route_info.reverse!
    @flight_route_info.each do |flight|
      @total_fuel_needed += @ship.operate(@ship.mass + @total_fuel_needed, flight)
    end
    p "Here is the total amount of fuel you used: #{@total_fuel_needed.round} kg"
  end
end

Main.new(
  75_432,
  [
    [:launch, 9.807],
    [:land, 1.62],
    [:launch, 1.62],
    [:land, 3.711],
    [:launch, 3.711],
    [:land, 9.807]
  ]
)

# You can test it
# Main.new(
#   14606,
#   [
#     [:launch, 9.807],
#     [:land, 3.711],
#     [:launch, 3.711],
#     [:land, 9.807]
#   ]
# )

# You can test it
# Main.new(
#   28801,
#   [
#     [:launch, 9.807],
#     [:land, 1.62],
#     [:launch, 1.62],
#     [:land, 9.807]
#   ]
# )
