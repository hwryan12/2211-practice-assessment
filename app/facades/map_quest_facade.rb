class MapQuestFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def directions
    service = MapQuestService.new.get_directions(@origin, @destination)
    Directions.new(service[:route])
  end
end