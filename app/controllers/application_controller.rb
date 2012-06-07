class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'public'
  helper_method :super_admin?

  def after_sign_in_path_for(resource)
    case resource.account_type
      when 'employer'
        :employer_root
      when 'jobseeker'
        #TODO to be added when jobseeker dashboard is added
        :root
      else
        :root
    end
  end

  def super_admin?
    false
  end

  rescue_from Mongoid::Errors::DocumentNotFound, :with => :render_404

  def render_404
    render 'common/_p404'
  end
end
