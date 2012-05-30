class JobsController < ApplicationController
  layout 'public'
  before_filter :load_company

  def index
    @jobs = Job.active.where(company_id: params[:company_id]).sort(expires_at: 1)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  private
    def load_company
      @company = Company.find(params[:company_id])
    end
end
