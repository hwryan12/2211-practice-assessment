require 'rails_helper'

describe "user can search for nearest station" do
  scenario "and see the nearest station" do
    visit '/'
    select "Griffin Coffee", from: :location
    click_button "Find Nearest Station"
    
    save_and_open_page
    expect(current_path).to eq("/search")
    expect(page).to have_content("Name: Shake Shack - Tesla Supercharger")
    expect(page).to have_content("Address: 2027 Depew St, Denver, CO 80214")
    expect(page).to have_content("Fuel Type: ELEC")
    expect(page).to have_content("Access Times: 24 hours daily")
    expect(page).to have_content("Distance: 0.7 miles")
    expect(page).to have_content("Travel Time: 1 min 54 sec")
    expect(page).to have_content("Head east on W 25th Ave. Go for 246 ft. Turn right onto Sheridan Blvd (CO-95). Go for 0.4 mi. Turn right onto W 20th Ave. Go for 0.2 mi. Turn right onto Depew St. Go for 174 ft. Arrive at Depew St.")
  end
end