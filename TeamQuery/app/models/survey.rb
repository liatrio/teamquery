class Survey < ActiveRecord::Base
  has_one :users
  has_many :questions
  accepts_nested_attributes_for :questions
end
