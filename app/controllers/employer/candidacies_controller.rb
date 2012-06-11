class Employer::CandidaciesController < Employer::EmployerController

  # GET /jobs
  # GET /jobs.json
  def index
    @job = current_user.company.jobs.find(params[:job_id])
    @candidacies = @job.candidacies
  end


  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
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
