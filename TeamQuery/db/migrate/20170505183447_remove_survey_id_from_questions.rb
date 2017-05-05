class RemoveSurveyIdFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :surveyid, :integer
  end
end
