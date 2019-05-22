require 'rails_helper'

describe 'As a user' do
  it 'can display a list of students by house' do

  visit "/"
  select("Slytherin", from: "house")
  click_on "Get Students"
  expect(current_path).to eq("/search")
  expect(page).to have_content("22 Students")
  expect(page).to have_css(".student", count: 22)
  within("#student52") do
      expect(page).to have_content("ID = 52")
      expect(page).to have_content("Name = Gormlaith Gaunt")
    end
  end
end
