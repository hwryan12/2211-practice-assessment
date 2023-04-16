require 'rails_helper'

describe "user can search for nearest station" do
  scenario "and see the nearest station" do
    visit '/'
    save_and_open_page
    select "Griffin Coffee", from: :location
    click_button "Find Nearest Station"

    expect(current_path).to eq("/search")
    expect(page).to have_content("Name: Shake Shack - Tesla Supercharger")
    expect(page).to have_content("Address: 2027 Depew St, Denver, CO 80214")
    expect(page).to have_content("Fuel Type: ELEC")
    expect(page).to have_content("Access Times: 24 hours daily")
    expect(page).to have_content("Distance: 0.1 miles")
    expect(page).to have_content("Travel Time: 1 min")
    expect(page).to have_content("Directions: Turn left onto Lawrence St Destination will be on the left")
  end
end