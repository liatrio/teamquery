class FixSurveys < ActiveRecord::Migration
  def change
    remove_column :surveys, :questions_id, :integer
    add_column :surveys, :question1, :integer
    add_column :surveys, :question2, :integer
    add_column :surveys, :question3, :integer
  end
end
