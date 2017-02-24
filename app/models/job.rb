class Job < ActiveRecord::Base
  # belongs_to :worker # added   stops jobs from creating!!!

  validates :title, :presence => true
end
