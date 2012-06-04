class Console::JobsController < Console::ConsoleController
  include UrlHelper

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all.sort(_id: -1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  def duplicate
    @job = Job.find(params[:id])
    redirect_to :console_jobs, :alert => 'No job found!' if @job.blank?
    @new_job = @job.dup
    @new_job.display = false
    @new_job.created_at = Time.now
    @new_job.updated_at = Time.now
    if @new_job.save
      redirect_to edit_console_job_path(@new_job), :notice => 'Job is duplicated! You are editing the duplicated job!'
    else
      redirect_to console_jobs_path, :alert => 'Sorry, the job could not be duplicated!'
    end

  end

  # POST /jobs
  # POST /jobs.json
  def create
    @company = Company.find(params[:job][:company_id])

    @job = @company.jobs.new(params[:job].except(:company_id))
    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: 'Job was successfully created.' }
        format.json { render json: job_url(@job), status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to job_url(@job), notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to console_jobs_url }
      format.json { head :no_content }
    end
  end
end
