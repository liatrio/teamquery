class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end
  def show
  end
  def new
   @user = User.find params[:user_id]
   @survey = @user.surveys.new
  end
  def create
     @user = User.find params[:user_id]
    @survey = @user.surveys.new(survey_params)
    if @survey.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  private
   def set_survey
        @recipe = Recipe.find(params[:id])
   end
   def survey_params
    params.require(:survey).permit(:happiness_level, :friend_level, :health_level, :extra_comments)
   end
end
