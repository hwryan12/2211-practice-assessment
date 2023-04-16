require 'rails_helper'

RSpec.describe Station do
  it 'exists' do
    data = {
      :station_name=>"Shake Shack",
      :street_address=>"1234 Main St",
      :city=>"Denver",
      :state=>"CO",
      :zip=>"80214",
      :fuel_type_code=>"ELEC",
      :access_days_time=>"24 hours daily"
    }

    station = Station.new(data)

    expect(station).to be_a(Station)
    expect(station.name).to eq("Shake Shack")
    expect(station.address).to eq("1234 Main St, Denver, CO 80214")
    expect(station.fuel_type).to eq("ELEC")
    expect(station.access_times).to eq("24 hours daily")
  end
end