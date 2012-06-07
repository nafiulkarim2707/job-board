class Employer::EmployerController < ApplicationController
  layout 'employer'
  before_filter :authenticate_user!,  :employer_only

  def is_employer?
    current_user.account_type == 'employer'
  end

  def employer_only
    redirect_to root_path unless is_employer?
  end
end
