class Directions
  attr_reader :distance,
              :travel_time,
              :directions

  def initialize(data)
    @distance = data[:distance]
    @travel_time = data[:formattedTime]
    @directions = data[:maneuvers]
  end
end