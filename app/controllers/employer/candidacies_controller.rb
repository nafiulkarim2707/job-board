class Employer::CandidaciesController < Employer::EmployerController

  # GET /jobs
  # GET /jobs.json
  def index
    @job = current_user.company.jobs.find(params[:job_id])
    @candidacies = @job.candidacies
  end

  def edit
    @status = params[:status]
    @candidacy = current_user.company.jobs.where(id: params[:job_id]).first.candidacies.where(:id => params[:candidacy_id]).first
    if @status.present? and @candidacy.present?
      @candidacy.update_attribute(:status, @status)
      respond_to do |format|
        format.js
        format.html do
          redirect_to employer_job_candidacies_path(@candidacy.job.id),
                      :notice => sprintf('candidacy is marked as %s', @status)
          return
        end
      end
    else
      redirect_to :back
    end
  end

  def destroy
    @candidacy = current_user.company.jobs.where(id: params[:job_id]).first.candidacies.where(:id => params[:candidacy_id]).first
    if @candidacy.present?
      @candidacy.delete
      respond_to do |format|
        format.js
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
