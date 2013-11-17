class User < ActiveRecord::Base
	has_secure_password

	has_many :sheets

  validates_presence_of :name, on: :create
  validates_presence_of :email, on: :create
end
