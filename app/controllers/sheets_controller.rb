class SheetsController < ApplicationController
	def index
		@sheets = Sheet.all
	end

	def new

		@sheet = current_user.sheets.build
		3.times {@sheet.airtimes.build}
		3.times {@sheet.promos.build}
		
	end

	def create
		@sheet = current_user.sheets.build(sheet_params)
		@property = Property.new
		
		if @sheet.save
			redirect_to sheets_path
		else
			render :new
		end
	end

	def edit
		@sheet = Sheet.find(params[:id])
	end

	def update
		@sheet = Sheet.find(params[:id])
		if @sheet.update_attributes(sheet_params)
			redirect_to edit_sheet_path(@sheet)
		else
			render :edit
		end
	end

	def destroy
		@sheet = Sheet.find(params[:id])
		@sheet.destroy
		redirect_to sheets_path
	end
end
