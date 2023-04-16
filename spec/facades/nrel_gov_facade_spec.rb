require 'rails_helper'

RSpec.describe NrelGovFacade do
  describe 'instance methods' do
    describe '#station' do
      it 'returns a station object' do
        search = '5224+W+25th+Ave+Denver+CO+80214'
        station = NrelGovFacade.new(search).station

        expect(station).to be_a(Station)
        expect(station.name).to eq("Shake Shack - Tesla Supercharger")
        expect(station.address).to eq("2027 Depew St, Denver, CO 80214")
        expect(station.fuel_type).to eq("ELEC")
        expect(station.access_times).to eq("24 hours daily")
      end
    end
  end
end