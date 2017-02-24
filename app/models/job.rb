class Job < ActiveRecord::Base
  belongs_to :user # added may not need to connect job to user.
  belongs_to :worker # added

  validates :title, :presence => true
end
