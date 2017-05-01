class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :happiness_level
      t.integer :health_level
      t.integer :friend_level
      t.integer :difficulty_level
      t.string :extra_comments
      t.timestamps null: false
    end
  end
end
