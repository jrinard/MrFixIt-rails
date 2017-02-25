require 'rails_helper'

describe "Job Paths", type: :feature do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe "Create and View Job" do
    it "allows the user to create new Job", :js => true do
      visit jobs_path
      click_link("Add Job")
      fill_in 'Title', :with => 'Code'
      click_on 'Create Job'
      expect(page).to have_content 'Add Job'
    end
  end
  it "delete a job" do
    visit jobs_path
    click_link("Add Job")
    fill_in 'Title', :with => 'Code'
    click_on 'Create Job'
    click_on 'Cancel'
    expect(page).to_not have_content 'Code'
  end
end
