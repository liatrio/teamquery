class CompanyColumns < ActiveRecord::Migration
  def change
     add_column :companies, :happiness_score, :integer
     add_column :companies, :happiness_users, :integer
     add_column :companies, :health_score, :integer
     add_column :companies, :health_users, :integer
     add_column :companies, :friendliness_score, :integer
     add_column :companies, :friendliness_users, :integer
     add_column :companies, :difficulty_score, :integer
     add_column :companies, :difficulty_users, :integer
  end
end
