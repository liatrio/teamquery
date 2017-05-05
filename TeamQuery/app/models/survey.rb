class Survey < ActiveRecord::Base
  has_one :users
  has_many :questions
end
