require 'rails_helper'

RSpec.describe MapQuestFacade do
  describe 'instance methods' do
    describe '#directions' do
      it 'returns a directions object' do
        origin = '5224 W 25th Ave, Denver, CO 80214'
        destination = '2027 Depew St, Denver, CO 80214'
        directions = MapQuestFacade.new(origin, destination).directions

        expect(directions).to be_a(Directions)
        expect(directions.travel_time).to eq(directions.travel_time)
        expect(directions.distance).to eq(0.6997)
        expect(directions.directions).to eq(["Head east on W 25th Ave. Go for 246 ft.", "Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi.", "Turn right onto W 20th Ave. Go for 0.2 mi.", "Turn right onto Depew St. Go for 174 ft.", "Arrive at Depew St."])
      end
    end
  end
end