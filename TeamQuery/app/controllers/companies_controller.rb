class CompaniesController < ApplicationController
  def index
    #@companies = Company.all
    if current_user
      @nav_company = Company.find_by id: current_user.company_id
      @company = Company.find_by id: current_user.company_id
    end
  end
  def new
    if current_user
      @nav_company = Company.find_by id: current_user.company_id
    end
    @company = Company.new
  end
  def create
    @company = Company.new(company_params)
    @company.attributes = {
      :happiness_score => 0,
      :happiness_users => 0,
      :health_score => 0,
      :health_users => 0,
      :friendliness_score => 0,
      :friendliness_users => 0,
      :difficulty_score => 0,
      :difficulty_users => 0
    }
    if @company.save
      @user = User.find_by name: current_user.name
      @user.update_attribute(:company_id, @company.id)
      redirect_to '/companies'
    else
      redirect_to 'register_companies'
    end
  end
  private
    def company_params
      params.require(:company).permit(:name)
    end
end
