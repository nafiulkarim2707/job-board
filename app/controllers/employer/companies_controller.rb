class Employer::CompaniesController < Employer::EmployerController
  def manage
    @company = current_user.company || Company.new({:user_id => current_user.id})
  end

  def create
    @company = Company.new(params[:company])
    @company.user_id = current_user.id
    if @company.save
      redirect_to employer_manage_company_path, notice: 'company was created successfully!.'
    else
      render action: "manage"
    end
  end

  def update
    @company = current_user.company
    if @company.update_attributes(params[:company].except(:user_id))
      redirect_to employer_manage_company_path, notice: 'company was successfully updated.'
    else
      render action: "manage"
    end
  end
end
