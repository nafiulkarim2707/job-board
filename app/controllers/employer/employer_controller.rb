class Employer::EmployerController < ApplicationController
  layout 'employer'
  before_filter :authenticate_user!,  :employer_only
  include UrlHelper

  def is_employer?
    current_user.account_type == 'employer'
  end

  def employer_only
    redirect_to root_path, :alert => 'you do not have permission to access employer panel!' unless is_employer?
  end
end
