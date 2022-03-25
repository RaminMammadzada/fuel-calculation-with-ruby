class Ship
  attr_reader :mass
  attr_accessor :is_in_air

  def initialize(mass)
    @mass = mass
    @is_in_air = false
  end

  def calculate_fuel_for_launch(mass, gravity)

    fuel_mass = mass * gravity * 0.042 - 33

    if fuel_mass < 0
      return 0
    end

    fuel_mass + calculate_fuel_for_launch(fuel_mass, gravity)
  end

  def calculate_fuel_for_landing(mass, gravity)
    fuel_mass = mass * gravity * 0.033 - 42

    if fuel_mass < 0
      return 0
    end

    fuel_mass + calculate_fuel_for_landing(fuel_mass, gravity)
  end

  def operate(operation_mass, flight)
    flight_type = flight[0].to_s
    fuel_mass_needed_for_flight = 0

    if flight_type == 'launch'
      fuel_mass_needed_for_flight = calculate_fuel_for_launch(operation_mass, flight[1])
    elsif flight_type == 'land'
      fuel_mass_needed_for_flight = calculate_fuel_for_landing(operation_mass, flight[1])
    else
      throw("There is an unexpected flight type found: #{flight[0]}")
    end

    return fuel_mass_needed_for_flight
  end
end
