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

		@property = Property.find_or_create_by(name: @sheet.property_name)
		@property.save
		@sheet.property_id = @property.id

		@teamname1 = Teamname.find_or_create_by(name: @sheet.team1)
		@teamname1.save

		@teamname2 = Teamname.find_or_create_by(name: @sheet.team2)
		@teamname2.save

		if @sheet.save
			redirect_to sheets_path
		else
			render :new
		end
	end

	def edit
		@sheet = Sheet.find(params[:id])
		@property_names = Property.all.map{|x| x.name}
		@teamnames = Teamname.all.map{|x| x.name}
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

	def show
		@sheet = Sheet.find(params[:id])
		redirect_to edit_sheet_path(@sheet)
	end

	def destroy
		@sheet = Sheet.find(params[:id])
		@sheet.destroy
		redirect_to sheets_path
	end

	def sheet_params
		params.require(:sheet).permit(:sens,:flames,:oilers,:van_hky,:world,:one,:east,:ontario,:west,:pacific,:is_360,:snipe_required,:team1,:team2,:property_name,:property_id,:user_id,:note,:event_date,:due_date, airtimes_attributes: [:sheet_id,:timezone,:time], promos_attributes: [:length,:quantel_name,:s4m_name,:mcr_number,:purge_date,:sheet_id])
	end
end