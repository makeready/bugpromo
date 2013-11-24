class TblSpec < ActiveRecord::Base
	belongs_to :sheet

	def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |sheet|
        csv << sheet.attributes.values_at(*column_names)
      end
    end
  end
end
