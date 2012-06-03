class StaticController < ApplicationController
  layout 'public'

  def index
    page_name = params[:page]
    @page = Page.where(:_id => page_name).first
  end
end
