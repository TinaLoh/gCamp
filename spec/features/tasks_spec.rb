require 'rails_helper'

feature "Tasks" do

  scenario "User creates a task" do
    Event.create!(
    description: "Task Alpha"
    )

    visit tasks_path
    click_on "New Task"
    fill_in "Description", with: "Task Alpha"
    fill_in "Due Date", with: "12-30-2014"
    click_on "Create Task"

    expect(page).to have_content("Task Alpha")
    expect(page).to have_content("12-30-2014")
  end

end
