class User < ActiveRecord::Base
  has_many :surveys
  belongs_to :company
  has_secure_password
end
