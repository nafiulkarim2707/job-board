class CompaniesController < ApplicationController
  layout 'public'

  caches_page :show

  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end
end
