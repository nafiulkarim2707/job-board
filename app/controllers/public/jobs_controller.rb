class Public::JobsController < ApplicationController
  layout 'public'

  def index
    @jobs = Job.active.sort(expires_at: 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end
end
