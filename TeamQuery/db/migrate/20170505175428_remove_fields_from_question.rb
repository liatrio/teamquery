class RemoveFieldsFromQuestion < ActiveRecord::Migration
  def change
    remove_column :questions, :users_id, :integer
    remove_column :questions, :taken, :boolean
    remove_column :questions, :survey_id, :int
    remove_column :questions, :taken, :boolean
  end
end
