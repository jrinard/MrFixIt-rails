require 'rails_helper'

describe "Job Paths", type: :feature do
  before(:each) do
    @worker = FactoryGirl.create(:worker)
    login_as(@worker, :scope => :worker)
    @job = FactoryGirl.create(:job)
  end

  describe "Claiming Job" do
    it "Allows the worker to claim job", :js => true do
      visit jobs_path
      click_link("coder")
      click_link("Claim Job")
      expect(page).to have_content "Job status: Claimed"
    end
    it "Allows the worker to complete a job", :js => true do
      visit jobs_path
      click_link("coder")
      click_link("Claim Job")
      visit jobs_path
      click_link("coder")
      click_link("Complete Job")
      expect(page).to have_content "Job has been completed!"
    end
  end
end
