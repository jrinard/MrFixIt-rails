class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
   @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end

## added
  def edit
    @job = Job.find(params[:id])
  end

## Job being claimed
  def update
    @job = Job.find(params[:id])
    if current_worker
      if @job.update(pending: true, worker_id: current_worker.id)
        respond_to do |format|
        format.html { redirect_to job_path(@job) }
        format.js
        end
      else
        render :show
        flash[:notice] = "Something went wrong!"
      end
    else
      # We need to streamline this process better in the future! - Mr. Fix-It.
      flash[:notice] = 'You must have a worker account to claim a job. Register for one using the link in the navbar above.'
      redirect_to job_path(@job)
    end
  end

  ## NO DESTROY. Keep in mind

private
  def job_params
    params.require(:job).permit(:title, :description, :worker_id)
  end
end
