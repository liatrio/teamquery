class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  def index
    @surveys = Survey.all
  end
  def show
   @survey = Survey.find(params[:id])
  end
  def new
   @survey = Survey.new
  end
  def create
    @user = User.find params[:user_id]
    @company = @user.company_id
    @survey = @user.surveys.new(survey_params)
    if @survey.save
      redirect_to survey_path(@survey)
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    if @survey.update(survey_params)
      @survey.taken = true
      redirect_to survey_url(@survey), notice: 'Survey was updated'
    else
      render :edit
    end
  end
  private
   def set_survey
        @survey = Survey.find(params[:id])
   end
   def survey_params
    params.require(:survey).permit(:happiness_level, :friend_level, :health_level, :extra_comments)
   end
end
