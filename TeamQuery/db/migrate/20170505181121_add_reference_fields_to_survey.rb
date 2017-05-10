class AddReferenceFieldsToSurvey < ActiveRecord::Migration
  def change
    add_reference :surveys, :users, index: true
    add_reference :surveys, :questions, index: true
  end
end
