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
    @question1.trait = params[:question1_trait]
    @question1.save

    @question2 = Question.new
    @question2.text = params[:question2]
    @question2.trait = params[:question2_trait]
    @question2.save

    @question3 = Question.new
    @question3.text = params[:question3]
    @question3.trait = params[:question3_trait]
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
  def submit
    @company = Company.find_by id: current_user.company_id
    @survey = Survey.find_by id: params[:survey_id]
    @question1 = Question.find_by id: @survey.question1
    @question2 = Question.find_by id: @survey.question2
    @question3 = Question.find_by id: @survey.question3

    if @question1.trait == 'happiness'
      @company.happiness_score = @company.happiness_score+Integer(params[:question1])
      @company.happiness_users = @company.happiness_users+1
    elsif @question1.trait == 'health'
      @company.health_score = @company.health_score+Integer(params[:question1])
      @company.health_users = @company.health_users+1
    elsif @question1.trait == 'friendliness'
      @company.friendliness_score = @company.friendliness_score+Integer(params[:question1])
      @company.friendliness_users = @company.friendliness_users+1
    else
      @company.difficulty_score = @company.difficulty_score+Integer(params[:question1])
      @company.difficulty_users = @company.difficulty_users+1
    end

    if @question2.trait == 'happiness'
      @company.happiness_score = @company.happiness_score+Integer(params[:question2])
      @company.happiness_users = @company.happiness_users+1
    elsif @question2.trait == 'health'
      @company.health_score = @company.health_score+Integer(params[:question2])
      @company.health_users = @company.health_users+1
    elsif @question2.trait == 'friendliness'
      @company.friendliness_score = @company.friendliness_score+Integer(params[:question2])
      @company.friendliness_users = @company.friendliness_users+1
    else
      @company.difficulty_score = @company.difficulty_score+Integer(params[:question2])
      @company.difficulty_users = @company.difficulty_users+1
    end

    if @question3.trait == 'happiness'
      @company.happiness_score = @company.happiness_score+Integer(params[:question3])
      @company.happiness_users = @company.happiness_users+1
    elsif @question3.trait == 'health'
      @company.health_score = @company.health_score+Integer(params[:question3])
      @company.health_users = @company.health_users+1
    elsif @question3.trait == 'friendliness'
      @company.friendliness_score = @company.friendliness_score+Integer(params[:question3])
      @company.friendliness_users = @company.friendliness_users+1
    else
      @company.difficulty_score = @company.difficulty_score+Integer(params[:question3])
      @company.difficulty_users = @company.difficulty_users+1
    end

    @survey.delete
    @company.save
    redirect_to "/companies"
  end
end
