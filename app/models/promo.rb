class Promo < ActiveRecord::Base
	belongs_to :sheet
	has_one :ae_spec
end
