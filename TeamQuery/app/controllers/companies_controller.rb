class CompaniesController < ApplicationController
  def index
    #@companies = Company.all
    if current_user
      @company = Company.find_by id: current_user.company_id
    end
  end
  def new
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
