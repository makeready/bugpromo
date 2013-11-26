class Property < ActiveRecord::Base
	has_many :sheets
  has_many :tbl_specs, through: :sheets
end
