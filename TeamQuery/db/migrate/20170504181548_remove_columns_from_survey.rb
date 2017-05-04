class RemoveColumnsFromSurvey < ActiveRecord::Migration
  def change
        remove_column :surveys, :happiness_level, :integer
        remove_column :surveys, :health_level, :integer
        remove_column :surveys, :friend_level, :integer
        remove_column :surveys, :difficulty_level, :integer
  end
end
