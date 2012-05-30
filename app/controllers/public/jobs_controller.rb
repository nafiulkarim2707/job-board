class Public::JobsController < ApplicationController
  layout 'public'

  def index
    @jobs = Job.active.sort(expires_at: 1)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  def search

  end
end
