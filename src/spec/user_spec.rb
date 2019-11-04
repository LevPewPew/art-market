require 'rails_helper'

RSpec.feature "Log In" do
  let!(:project) { FactoryBot.create(:project) }

  it "updates a project successfully" do
    visit "/"
    click_link project.name
    click_link "Edit"
    fill_in "Name", with: "Ticketee"
    click_button "Update Project"
    expect(page).to have_content("Project was updated successfully")
  end
end