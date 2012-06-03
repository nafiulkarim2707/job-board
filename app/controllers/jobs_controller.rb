class JobsController < ApplicationController
  layout 'public'
  before_filter :load_company

  def index
    if @company.present?
      @jobs = Job.active.where(company_id: params[:company_id]).sort(expires_at: 1)
    else
      @jobs = Job.active.sort(expires_at: 1)
    end

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
      if params[:company_id].present?
        @company = Company.find(params[:company_id])
      end
    end
end
