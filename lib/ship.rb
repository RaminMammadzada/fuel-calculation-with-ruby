class Ship
  attr_reader :mass
  attr_accessor :is_in_air

  def initialize(mass)
    @mass = mass
    @is_in_air = false
  end

  def calculate_fuel_for_launch(mass, gravity)
    fuel_mass = mass * gravity * 0.042 - 33

    return 0 if fuel_mass.negative?

    fuel_mass + calculate_fuel_for_launch(fuel_mass, gravity)
  end

  def calculate_fuel_for_landing(mass, gravity)
    fuel_mass = mass * gravity * 0.033 - 42

    return 0 if fuel_mass.negative?

    fuel_mass + calculate_fuel_for_landing(fuel_mass, gravity)
  end

  def operate(operation_mass, flight)
    flight_type = flight[0].to_s
    fuel_mass_needed_for_flight = 0

    case flight_type
    when 'launch'
      fuel_mass_needed_for_flight = calculate_fuel_for_launch(operation_mass, flight[1])
    when 'land'
      fuel_mass_needed_for_flight = calculate_fuel_for_landing(operation_mass, flight[1])
    else
      throw("There is an unexpected flight type found: #{flight[0]}")
    end

    fuel_mass_needed_for_flight
  end
end
