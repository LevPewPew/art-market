require 'rails_helper'

RSpec.describe 'Home Page', type: :feature do
  scenario 'index page' do
    visit root_path
    expect(page).to have_content('Art Haus')
  end
end