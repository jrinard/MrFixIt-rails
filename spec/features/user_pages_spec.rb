require 'rails_helper'


describe "user login and logout" do
  it "login" do
    visit root_path
    click_on "Sign up User to Post Jobs"
    fill_in 'Email', :with => 'r@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    expect(page).to have_content "Welcome! You have signed up successfully."
  end
  it "logout" do
    visit root_path
    click_on "Sign up User to Post Jobs"
    fill_in 'Email', :with => 'r@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_on 'Sign up'
    click_link 'Log Out'
    expect(page).to have_content "Signed out successfully."
  end
end
