class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
    @questions = Question.all
  end
  def show
    @survey = Survey.find(params[:id])
    print "DEBUG INFO HERE"
    print @survey
    @question = @survey.questions_id
  end
  def new
    @survey = Survey.new
  end
  def create
    if current_user
      @users = User.all
      for u in @users.size
        if u.company_id == current_user.company_id
          @question1 = Question.new
          @question1.text = params[:question1]
          @question1.save

          @question2 = Question.new
          @question2.text = params[:question2]
          @question2.save

          @question3 = Question.new
          @question3.text = params[:question3]
          @question3.save

          @survey = Survey.new
          @survey.question1 = @question1.id
          @survey.question2 = @question2.id
          @survey.question3 = @question3.id

          @survey.save
#          if @survey.save
#            redirect_to surveys_path
#          else
#            redirect_to 'create_surveys'
#          end
        end
      end
      redirect_to 'create_surveys'
    end
  end
end
