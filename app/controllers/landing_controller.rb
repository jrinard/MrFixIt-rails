class LandingController < ApplicationController
  # before_action :authenticate_user! #forces a login so we don't have random jobs without knowing who posted them

  def index
    render :index
  end
end
