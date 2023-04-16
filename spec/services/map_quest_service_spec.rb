require 'rails_helper'

describe 'MapQuestService' do
  context 'instance methods' do
    context '#get_directions' do
      it 'returns the directions of the trip' do
        start_location = '5224+W+25th+Ave+Denver+CO+80214'
        end_location = '2027+Depew+St+Denver+CO+80214'

        results = MapQuestService.new.get_directions(start_location, end_location)
        expect(results).to be_a(Hash)
        expect(results[:route]).to be_a(Hash)
        expect(results[:route]).to have_key(:distance)
        expect(results[:route][:distance]).to be_a(Float)
        expect(results[:route]).to have_key(:formattedTime)
        expect(results[:route][:formattedTime]).to be_a(String)
        expect(results[:route]).to have_key(:legs)
        expect(results[:route][:legs][0][:maneuvers]).to be_an(Array)
        
        results[:route][:legs][0][:maneuvers].each do |maneuver|
          expect(maneuver).to have_key(:narrative)
          expect(maneuver[:narrative]).to be_a(String)
        end
      end
    end
  end
end