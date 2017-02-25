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
      expect(page).to have_content 'Code'
    end
    it "prevents the user from creating jobs if no name is provided", :js => true  do
      visit jobs_path
      click_link("Add Job")
      click_on 'Create Job'
      expect(page).to have_content 'Error please make sure you filled in everything'
    end
  end
end
