class Promo < ActiveRecord::Base
	belongs_to :sheet
	has_many :ae_specs
	has_many :tbl_specs
end
