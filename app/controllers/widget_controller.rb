class WidgetController < ApplicationController

  def job_list
    render :job_list, :layout => false
  end
end
