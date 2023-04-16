class NrelGovFacade
  def initialize(search)
    @search = search
  end

  def station
    service = NrelGovService.new.station(@search)
    Station.new(service[:features][0][:properties])
  end
end