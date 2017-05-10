class AddColumnsToQuestion < ActiveRecord::Migration
  def change
     add_column :questions, :surveyid, :integer
     add_column :questions, :text, :string
     add_column :questions, :trait, :string
     add_column :questions, :taken, :boolean
  end
end
