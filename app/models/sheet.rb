class Sheet < ActiveRecord::Base
	belongs_to :user
	belongs_to :property
	has_many :promos, dependent: :delete_all
	has_many :airtimes
	has_many :ae_specs, dependent: :delete_all
	has_many :tbl_specs, dependent: :delete_all

	accepts_nested_attributes_for :airtimes
	accepts_nested_attributes_for :promos

  validates_presence_of :weekday1, :team1, :team2, :property_name
  validate :check_first_time

  def check_first_time
    if airtimes[0].timezone == "" || airtimes[0].time == nil
      errors.add(:id,"First airtime must be filled out and in the ET timezone")
      false
    end
  end
end
