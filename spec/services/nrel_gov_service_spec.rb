require 'rails_helper'

describe 'NrelService' do
  context 'instance methods' do
    context '#station' do
      it 'returns the nearest electric station' do
        location = '5224+W+25th+Ave+Denver+CO+80214'

        results = NrelGovService.new.station(location)
        # binding.pry
        expect(results).to be_a(Hash)
        expect(results[:features]).to be_an(Array)
        expect(results[:features][0]).to be_a(Hash)
        expect(results[:features][0][:properties]).to be_a(Hash)
        expect(results[:features][0][:properties][:station_name]).to be_a(String)
        expect(results[:features][0][:properties][:street_address]).to be_a(String)
        expect(results[:features][0][:properties][:city]).to be_a(String)
        expect(results[:features][0][:properties][:state]).to be_a(String)
        expect(results[:features][0][:properties][:zip]).to be_a(String)
        expect(results[:features][0][:properties][:fuel_type_code]).to be_a(String)
        expect(results[:features][0][:properties][:access_days_time]).to be_a(String)
      end
    end
  end
end