class SearchController < ApplicationController
  def index
    @station = NrelGovFacade.new(params[:location]).station
    @directions = MapQuestFacade.new(params[:location], @station.address).directions
    # binding.pry
  end
end
