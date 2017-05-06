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
    @question = Question.new
  end
  def create
    @question = Question.new(question_params)
    @question.attributes = {
      :text => textnew,
      :trait => traitnew
    }
  end
  private
    def question_params
      params.require(:question).permit(:textnew, :traitnew)
    end
end
