class Candidate::CandidateController < ApplicationController
  layout 'candidate'
  before_filter :authenticate_user!,  :candidate_only

  def is_candidate?
    current_user.account_type == 'jobseeker'
  end

  def candidate_only
    redirect_to root_path unless is_candidate?
  end
end
