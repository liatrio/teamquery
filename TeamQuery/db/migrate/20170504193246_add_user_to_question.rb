class AddUserToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :users, index: true
  end
end
