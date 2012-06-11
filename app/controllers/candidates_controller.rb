class CandidatesController < ApplicationController
  def show
    @resume = Resume.where(:candidate_id => params[:id]).first

    render 'candidate/resume/show'
  end
end
