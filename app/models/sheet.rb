class Sheet < ActiveRecord::Base
	belongs_to :user
	belongs_to :property
	has_many :promos, dependent: :delete_all
	has_many :airtimes
	has_many :ae_specs, through: :promos
	has_one :tbl_spec, dependent: :delete

	accepts_nested_attributes_for :airtimes
	accepts_nested_attributes_for :promos
end
