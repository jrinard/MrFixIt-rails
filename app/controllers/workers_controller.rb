class WorkersController < ApplicationController
  def show
    @worker = current_worker
    render :show
  end

#### Josh this needs looked at
  def new
    # current_worker refers to a worker account currently logged in. current_user refers to a user account currently logged in.
    if current_worker
      redirect_to worker_path(current_worker)
      flash[:notice] = "You're already logged into a WORKER account!"
    elsif current_user
      flash[:notice] = "You're CURRENT user so you were LOGGED OUT"
      # need to make sure users signing up to be workers are signed out of their user account first. -Mr. Fix-It
      sign_out :user
      redirect_to new_worker_registration_path
    else
      redirect_to new_worker_registration_path
    end
  end

end
