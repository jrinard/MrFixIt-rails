class Job < ActiveRecord::Base
  # belongs_to :worker # stops jobs from creating may not need!!!

  validates :title, :presence => true
end
