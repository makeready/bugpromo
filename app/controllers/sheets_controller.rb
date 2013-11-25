require 'debugger'

class SheetsController < ApplicationController
	autocomplete :property, :name
	def index
		@sheets = Sheet.all
	end

	def new
		@sheet = current_user.sheets.build
		3.times {@sheet.airtimes.build}
		5.times {@sheet.promos.build}
		@property_names = Property.all.map{|x| x.name}
		@teamnames = Teamname.all.map{|x| x.name}
	end

	def create
		@sheet = current_user.sheets.build(sheet_params)
		@sheet.save
		update_property
		update_teamnames
		update_tbl_spec
		update_ae_spec	

		redirect_to sheets_path
	end

	def update_tbl_spec
		#CREATE TBL SPEC  --- CSV FILE
		@tbl_spec = TblSpec.find_or_create_by(sheet_id: @sheet.id)
		@tbl_spec.sheet_id = @sheet.id
		puts "sheet.id: #{@sheet.id}, tbl_spec.sheet_id: #{@tbl_spec.sheet_id}"
		@tbl_spec.image_path = @sheet.property.image_path
		@tbl_spec.property_name = @sheet.property_name
		@tbl_spec.team1 = @sheet.team1
		@tbl_spec.team2 = @sheet.team2
		@tbl_spec.time_variable = ""
		@sheet.airtimes.each do |airtime|
			@tbl_spec.time_variable += (airtime.time.to_s + " " + airtime.timezone + ";")
		end
		@tbl_spec.day = @sheet.weekday1  #how to handle multiple weekend names?
		@tbl_spec.world = @sheet.world
		@tbl_spec.east = @sheet.east
		@tbl_spec.ontario = @sheet.ontario
		@tbl_spec.west = @sheet.west
		@tbl_spec.pacific = @sheet.pacific
		@tbl_spec.one = @sheet.one
		@tbl_spec.logo_path = @sheet.property.logo_path
		@tbl_spec.save 
	end

	def update_ae_spec
		#CREATE AE SPEC  --- TEXT FILE FOR AFTEREFFECTS
		@sheet.promos.each do |promo|
			@ae_spec = AeSpec.find_or_create_by(promo_id: promo.id)
			@ae_spec.content = ""
			@ae_spec.sheet_id = @sheet.id
			@ae_spec.save
		end
	end

	def update_property
		#ADDS NEW ENTRY TO PROPERTY TABLE IF NAME DOES NOT EXIST
		@property = Property.find_or_create_by(name: @sheet.property_name)
		@property.save
		@sheet.property_id = @property.id
	end

	def update_teamnames
				#ADDS TEAMNAMES TO TEAMNAME TABLE IF NAMES DO NOT EXIST
		@teamname1 = Teamname.find_or_create_by(name: @sheet.team1)
		@teamname1.save

		@teamname2 = Teamname.find_or_create_by(name: @sheet.team2)
		@teamname2.save
	end

	def edit
		@sheet = Sheet.find(params[:id])
		@property_names = Property.all.map{|x| x.name}
		@teamnames = Teamname.all.map{|x| x.name}
	end

	def update
		@sheet = Sheet.find(params[:id])

		update_property
		update_teamnames
		update_tbl_spec
		update_ae_spec

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
		params.require(:sheet).permit(:weekday1,:weekday2,:weekday3,:sens,:flames,:oilers,:van_hky,:world,:one,:east,:ontario,:west,:pacific,:is_360,:snipe_required,:team1,:team2,:property_name,:property_id,:user_id,:note,:event_date,:due_date, airtimes_attributes: [:sheet_id,:timezone,:time], promos_attributes: [:length,:quantel_name,:s4m_name,:mcr_number,:purge_date,:sheet_id])
	end
end