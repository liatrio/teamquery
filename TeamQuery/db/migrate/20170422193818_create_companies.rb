class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.decimal :happiness_score
      t.decimal :health_score
      t.decimal :friend_score
      t.decimal :difficulty_score
      t.timestamps null: false
    end
  end
end
