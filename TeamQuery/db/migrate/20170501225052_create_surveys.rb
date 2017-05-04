class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name
      t.integer :happiness_level
      t.integer :health_level
      t.integer :friend_level
      t.integer :difficulty_level
      t.boolean :taken
      t.references :users, index: true
      t.timestamps null: false
    end
  end
  add_foreign_key :surveys, :users
end
