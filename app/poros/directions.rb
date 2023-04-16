class Directions
  attr_reader :distance,
              :travel_time,
              :directions

  def initialize(data)
    @distance = data[:distance]
    @travel_time = travel_time_formatter(data)
    @directions = directions_formatter(data)
  end

  private
  def directions_formatter(data)
    data[:legs][0][:maneuvers].map do |maneuver|
      maneuver[:narrative]
    end.join('/n')
  end

  def travel_time_formatter(data)
    time = Time.strptime(data[:formattedTime], "%H:%M:%S")
    duration_in_seconds = time.hour * 3600 + time.min * 60 + time.sec
    formatted_duration = sprintf("%d min %d sec", duration_in_seconds / 60, duration_in_seconds % 60)
  end
end