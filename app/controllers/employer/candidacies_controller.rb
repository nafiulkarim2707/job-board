class Employer::CandidaciesController < Employer::EmployerController

  # GET /jobs
  # GET /jobs.json
  def index
    @job = current_user.company.jobs.find(params[:job_id])
    @candidacies = @job.candidacies
  end


  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to employer_jobs_url, :notice => 'job deleted successfully!'
  end

  def edit
    @status = params[:status]
    @candidacy = current_user.company.jobs.where(id: params[:job_id]).first.candidacies.where(:id => params[:candidacy_id]).first
    if @status.present? and @candidacy.present?
      @candidacy.update_attribute(:status, @status)
      respond_to do |format|
        format.js { render :edit && return }
        format.html do
          redirect_to employer_job_candidacies_path(@candidacy.job.id),
                      :notice => sprintf('candidacy is marked as %s', @status)
          return
        end
      end
    end
    redirect_to :back
  end

  def destroy
    @candidacy = current_user.company.jobs.where(id: params[:job_id]).first.candidacies.where(:id => params[:candidacy_id]).first
    if @candidacy.present?
      @candidacy.delete
      respond_to do |format|
        format.js { render :destroy && return }
        format.html do
          redirect_to employer_job_candidacies_path(@candidacy.job.id),
                      :notice => 'candidacy is deleted'
          return
        end
      end
    end
    redirect_to :back
  end
end
