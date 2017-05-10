class SurveysController < ApplicationController
  before_action :require_user
  def index
    if current_user
      @nav_company = Company.find_by id: current_user.company_id
    end
    @surveys = Survey.where(users_id: current_user.id)
  end
  def show
    if current_user
      @nav_company = Company.find_by id: current_user.company_id
    end
    @survey = Survey.find(params[:id])
    @question1 = Question.find_by id: @survey.question1
    @question2 = Question.find_by id: @survey.question2
    @question3 = Question.find_by id: @survey.question3
  end
  def new
    if current_user
      @nav_company = Company.find_by id: current_user.company_id
    end
    @survey = Survey.new
  end
  def create
    if current_user
      @nav_company = Company.find_by id: current_user.company_id
    end
      @question1 = Question.new
      @question1.text = params[:question1]
      @question1.save

      @question2 = Question.new
      @question2.text = params[:question2]
      @question2.save

      @question3 = Question.new
      @question3.text = params[:question3]
      @question3.save

      @users = User.where(company_id: current_user.company_id)
      @users.each do |u|
        @survey = Survey.new
        @survey.taken = false
        @survey.users_id = u.id
        @survey.question1 = @question1.id
        @survey.question2 = @question2.id
        @survey.question3 = @question3.id

        @survey.save
      end
      redirect_to "/"
  end
end
