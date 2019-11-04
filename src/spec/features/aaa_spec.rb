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

RSpec.feature "Sign Up" do
  it "Signs up a User in successfully" do
    visit "/"
    click_link "Sign In/Up"
    click_link "Sign up"
    fill_in "Email", with: "capy1@mail.com"
    fill_in "Password", with: "asdasd1"
    fill_in "Password confirmation", with: "asdasd1"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  it "User cannot sign up with short password" do
    visit "/"
    click_link "Sign In/Up"
    fill_in "Email", with: "capy1@mail.com"
    fill_in "Password", with: "asd"
    click_button "Log in"
    expect(page).to have_content("Sign up")
  end

  it "User cannot sign up without valid email" do
    visit "/"
    click_link "Sign In/Up"
    fill_in "Email", with: "capy1mail.com"
    fill_in "Password", with: "asdasd"
    click_button "Log in"
    expect(page).to have_content("Sign up")
  end
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

  it "Does not sign in with wrong email" do
    sign_up
    log_out

    visit "/"
    click_link "Sign In/Up"
    fill_in "Email", with: "WRONG@mail.com"
    fill_in "Password", with: "asdasd1"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end

  it "Does not sign in with wrong password" do
    sign_up
    log_out

    visit "/"
    click_link "Sign In/Up"
    fill_in "Email", with: "capy1@mail.com"
    fill_in "Password", with: "WRONG1"
    click_button "Log in"
    expect(page).to have_content("Invalid Email or password.")
  end
end