require 'rails_helper'

feature "Tasks" do

  scenario "User creates a task" do

    visit root_path
    click_on "Tasks"
    click_on "New Task"
    fill_in "Description", with: "Task Alpha"
    click_on "Create Task"

    expect(page).to have_content("Task Alpha")
  end


  scenario "User lists all tasks" do
    Task.create!(
    description: "New Year Eve dinner"
    )

    Task.create!(
    description: "Mail Christmas cards"
    )

    visit root_path
    click_on "Tasks"

    expect(page).to have_content("New Year Eve dinner")
    expect(page).to have_content("Mail Christmas cards")
  end


  scenario "User edits a task" do
    Task.create!(
    description: "Wrap Christmas presents"
    )

    visit root_path
    click_on "Tasks"
    expect(page).to have_content("Wrap Christmas presents")
    click_on "Edit"
    fill_in "Description", with: "Use red bows in gift wrap"
    click_on "Update Task"

    expect(page).to have_content("Use red bows in gift wrap")
    expect(page).to have_no_content("Wrap Christmas Presents")
  end

end
