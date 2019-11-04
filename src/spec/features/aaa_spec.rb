require 'rails_helper'

def sign_up
  visit "/"
  click_link "Sign In/Up"
  click_link "Sign up"
  fill_in "Email", with: "capy1@mail.com"
  fill_in "Password", with: "asdasd1"
  fill_in "Password confirmation", with: "asdasd1"
  click_button "Sign up"
end

def log_out
  visit "/"
  click_link "Sign Out"
end

RSpec.feature "Log In" do
  it "Logs a User in successfully" do
    sign_up
    log_out

    visit "/"
    click_link "Sign In/Up"
    fill_in "Email", with: "capy1@mail.com"
    fill_in "Password", with: "asdasd1"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
  end
end