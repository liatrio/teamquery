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
end
