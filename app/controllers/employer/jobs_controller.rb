class Employer::JobsController < Employer::EmployerController

  # GET /jobs
  # GET /jobs.json
  def index
    @company = current_user.company
    if @company.present?
      @jobs = current_user.company.jobs.all.sort(_id: -1)
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
    @job = Job.find(params[:job_id])
    redirect_to :employer_jobs, :alert => 'no job found!' if @job.blank?
    @new_job = @job.dup
    @new_job.display = false
    @new_job.created_at = Time.now
    @new_job.updated_at = Time.now
    if @new_job.save
      redirect_to edit_employer_job_path(@new_job), :notice => 'job is duplicated! you are editing the duplicated job!'
    else
      redirect_to employer_jobs_path, :alert => 'sorry, the job could not be duplicated!'
    end

  end

  # POST /jobs
  # POST /jobs.json
  def create
    @company = current_user.company
    @job = @company.jobs.new(params[:job].except(:company_id))
    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: 'job was successfully created.' }
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
        format.html { redirect_to job_url(@job), notice: 'job was successfully updated.' }
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

    redirect_to employer_jobs_url, :notice => 'job deleted successfully!'
  end
end
