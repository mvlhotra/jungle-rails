require 'rails_helper'

RSpec.feature "Valid User Login", type: :feature, js: true do
  before :each do
    User.create!({
      first_name:             'Nik',
      last_name:              'Mal',
      email:                  'wet_dog@hotmail.com',
      password:               'doggoz',
      password_confirmation:  'doggoz'
    })
  end

  scenario "Log in successfully" do
    # ACT
    visit '/login'
    fill_in 'email', with: 'wet_dog@hotmail.com'
    fill_in 'password', with: 'doggoz'
    click_on 'Submit'
    puts 
    # DEBUG
    save_screenshot
    # VERIFY
    within('nav') {expect(page).to have_content('Logout')}
  end
end