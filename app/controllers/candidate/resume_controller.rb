class Candidate::ResumeController < Candidate::CandidateController
  def manage
    @resume = Resume.find_or_initialize_by(:candidate_id => current_user.id, :email => current_user.email)
    @resume.positions.build
    @resume.educations.build
    @resume.skills.build
  end

  def update
    @resume = Resume.find_or_initialize_by(:candidate_id => current_user.id)
    if @resume.update_attributes(params[:resume].except(:candidate_id))
      redirect_to candidate_manage_resume_path, notice: 'resume info was successfully updated'
    else
      @resume.positions.build
      render action: "manage"
    end
  end
end
