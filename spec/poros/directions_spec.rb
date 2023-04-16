require 'rails_helper'

RSpec.describe Directions do
  it 'exists' do
    data = {
      :distance=> 10.0,
      :formattedTime=> "00:10:00",
      :legs=> [
        {
          :maneuvers=> [
              { :narrative=> "Start out going east on 25th Ave toward W 52nd Ave." },
              { :narrative=> "Turn left onto W 52nd Ave." },
              { :narrative=> "Turn right onto Depew St." },
              { :narrative=> "Arrive at 2027 Depew St." }
          ]
        }
      ]
    }

    directions = Directions.new(data)

    expect(directions).to be_a(Directions)
    expect(directions.distance).to eq(10.0)
    expect(directions.travel_time).to eq("10 min 0 sec")
    expect(directions.directions).to eq(["Start out going east on 25th Ave toward W 52nd Ave.", "Turn left onto W 52nd Ave.", "Turn right onto Depew St.", "Arrive at 2027 Depew St."])
  end
end