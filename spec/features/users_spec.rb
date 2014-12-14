require 'rails_helper'

feature "Users" do

  scenario "User can create a user" do

    visit root_path
    click_on "Users"
    click_on "New User"
    fill_in "First name", with: "Fidel"
    fill_in "Last name", with: "Castro"
    fill_in "Email", with: "fidel@gmail.com"
    click_on "Create User"

    expect(page).to have_content("Fidel")
    expect(page).to have_content("Castro")
    expect(page).to have_content("fidel@gmail.com")
    expect(page.current_path).to eq(users_path)
  end

  # scenario "User edits a user" do
  #   User.create!(
  #   first_name: "Mary"
  #   last_name: "Magdalene"
  #   email: mary@gmail.com
  #   )
  #
  #   visit root_path
  #   click_on "Users"
  #   expect(page).to have_content("Mary Magdalene")
  #   click_on "Edit"
  #   fill_in "First name", with: "Lady Mary"
  #   click_on "Update User"
  #
  #   expect(page).to have_content("Lady Mary Magdalene")
  # end


end
