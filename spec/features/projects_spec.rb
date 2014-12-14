require 'rails_helper'

feature "Projects" do

  scenario "User can create new project" do

  visit root_path
  click_on "Projects"
  click_on "New Project"
  fill_in "Name", with: "Learn JavaScript"
  click_on "Create Project"

  expect(page).to have_content("Learn JavaScript")
  # expect(page.current_path).to eq(project_path(:id))
  end

  scenario "User lists all projects" do

    Project.create!(
      name: "Plan X'mas party",
    )
    Project.create!(
      name: "Book NYE dinner",
    )

    visit root_path
    click_on "Projects"

    expect(page).to have_content("Plan X'mas party")
    expect(page).to have_content("Book NYE dinner")
  end


    scenario "User edits a project" do
      Project.create!(
      name: "Christmas bash"
      )

      visit root_path
      click_on "Projects"
      expect(page).to have_content("Christmas bash")
      click_on "Christmas bash"
      click_on "Edit"
      fill_in "Name", with: "NYE ball at the SF Hyatt"
      click_on "Update Project"

      expect(page).to have_content("NYE ball at the SF Hyatt")
      expect(page).to have_no_content("Christmas bash")
    end

  scenario "User deletes a project" do

    Project.create!(
      name: "Repaint kitchen walls"
    )

    visit root_path
    click_on "Projects"
    click_on "Repaint kitchen walls"
    click_on "Delete"

    expect(page).to have_no_content("Repaint kitchen walls")
    expect(page.current_path).to eq(projects_path)

  end
end
