class Employer::CompaniesController < Employer::EmployerController
  def manage
    @company = Company.find_or_initialize_by(:user_id => current_user.id)
  end

  def update
    @company = Company.find_or_initialize_by(:user_id => current_user.id)
    if @company.update_attributes(params[:company].except(:user_id))
      redirect_to employer_manage_company_path, notice: 'company info was successfully updated'
    else
      render action: "manage"
    end
  end
end
