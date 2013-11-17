class Sheet < ActiveRecord::Base
	belongs_to :user
	belongs_to :property
	has_many :promos
	has_many :airtimes
	has_many :ae_specs, through: :promos
	has_one :tbl_spec
end
