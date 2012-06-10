class Candidate::CandidacyController < Candidate::CandidateController

  def create
    @job = Job.find(params[:job_id])
    if !@job.is_active?
      redirect_to :back, :alert => 'sorry, this job is not open for any new application!' && return
    end

    @candidacy = Candidacy.new
    @candidacy.candidate_id = current_user.id
    @candidacy.job_id = @job.id
    if @candidacy.save
      redirect_to :back, :notice => sprintf('you\'ve just applied for the job %s at %s', @job.title, @job.company.name)
    end


  end

  def destroy
  end
end
