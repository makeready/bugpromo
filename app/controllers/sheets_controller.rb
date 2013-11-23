class SheetsController < ApplicationController
	autocomplete :property, :name
	def index
		@sheets = Sheet.all
	end

	def new

		@sheet = current_user.sheets.build
		3.times {@sheet.airtimes.build}
		3.times {@sheet.promos.build}
		@property_names = Property.all.map{|x| x.name}
		@teamnames = Teamname.all.map{|x| x.name}
	end

	def create
		@sheet = current_user.sheets.build(sheet_params)
		@property = Property.find_by name: params[:property_name]
		if @property
			@sheet.property_id = @property.id
		else
			@property = Property.new
			@property.name = @sheet.property_name
			@property.save
			@sheet.property_id = @property.id
		end

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
		@teamnames = Teamname.all

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

	def 
end
