class WidgetController < ApplicationController
  def job_list
    @jobs = Job.active.sort(expires_at: 1)

    respond_to do |format|
      format.html {render :job_list, :layout => false}
      format.json { render json: @jobs }
    end
  end
end
