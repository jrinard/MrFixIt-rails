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
      respond_to  do |format|
      format.html { redirect_to jobs_path }
      format.js
      end
    else
        flash[:notice] = "Error please make sure you filled in everything"
      render :new
    end
  end

## Added
  def edit
    @job = Job.find(params[:id])
  end

## Job Status Changing
  def update
    @job = Job.find(params[:id])
    if current_worker
      if params[:pending]
        @job.update(pending: true, worker_id: current_worker.id)
        respond_to  do |format|
        format.html { redirect_to job_path(@job.id) }
        format.js
        end
      elsif params[:completed]
        @job.update(completed: true)
        @job.update(pending: nil)
        respond_to  do |format|
        format.html { redirect_to job_path(@job.id) }
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

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_path }
      format.js
    end
  end

private
  def job_params
    params.require(:job).permit(:title, :description, :worker_id)
  end
end
