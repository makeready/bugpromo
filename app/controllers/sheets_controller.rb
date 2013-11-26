class SheetsController < ApplicationController
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
		@sheet.team1.upcase!
		@sheet.team2.upcase!
		@sheet.property_name.upcase!
		@property = Property.find_or_create_by(name: @sheet.property_name)
		if @sheet.save
			update_property(@property)
			update_teamnames

			update_tbl_spec(@sheet.weekday1, @property)
			update_tbl_spec(@sheet.weekday2, @property)
			update_tbl_spec(@sheet.weekday3, @property)

			update_ae_spec(@sheet.weekday1)
			update_ae_spec(@sheet.weekday2)	
			update_ae_spec(@sheet.weekday3)	

			redirect_to sheets_path
		else
			render :new
		end
	end

	def update_tbl_spec(weekday, property)
		if !weekday.empty?
			#CREATE TBL SPEC  --- CSV FILE
			@tbl_spec = TblSpec.find_or_create_by(sheet_id: @sheet.id, day: weekday)
			@tbl_spec.sheet_id = @sheet.id
			@tbl_spec.day = weekday
			@tbl_spec.image_path = property.image_path
			@tbl_spec.property_name = @sheet.property_name
			@tbl_spec.team1 = @sheet.team1
			@tbl_spec.team2 = @sheet.team2
			@tbl_spec.time_variable = ""
			@sheet.airtimes.each_with_index do |airtime, i|
				if airtime.time
					@tbl_spec.time_variable += airtime.time.hour.to_s + ":" + sprintf('%02d',airtime.time.min) + " " + airtime.timezone
					@tbl_spec.time_variable += " / " unless @sheet.airtimes[i+1].time == nil
				end
			end
			@tbl_spec.world = @sheet.world
			@tbl_spec.east = @sheet.east
			@tbl_spec.ontario = @sheet.ontario
			@tbl_spec.west = @sheet.west
			@tbl_spec.pacific = @sheet.pacific
			@tbl_spec.one = @sheet.one
			@tbl_spec.logo_path = property.logo_path
			@tbl_spec.save 
		end
	end

	def update_ae_spec(weekday)
		airtime = @sheet.airtimes.select{|a| a[:timezone] == "ET" }.first
		if airtime && !weekday.empty? 
			#CREATE AE SPEC  --- TEXT FILE FOR AFTEREFFECTS
			@ae_spec = AeSpec.find_or_create_by(sheet_id: @sheet.id, day: weekday)
			@ae_spec.team1 = @sheet.team1
			@ae_spec.team2 = @sheet.team2
			@ae_spec.day = weekday
			@ae_spec.start = airtime[:time].hour
			@ae_spec.sheet_id = @sheet.id
			@ae_spec.save
		end
	end

	def update_property(property)
		#ADDS NEW ENTRY TO PROPERTY TABLE IF NAME DOES NOT EXIST
		property.save
		@sheet.property_id = property.id
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
		@sheet.team1.upcase!
		@sheet.team2.upcase!
		@sheet.property_name.upcase!

		@property = Property.find_or_create_by(name: @sheet.property_name)
		update_property(@property)
		update_teamnames

		update_tbl_spec(@sheet.weekday1, @property)
		update_tbl_spec(@sheet.weekday2, @property)
		update_tbl_spec(@sheet.weekday3, @property)

		update_ae_spec(@sheet.weekday1)
		update_ae_spec(@sheet.weekday2)	
		update_ae_spec(@sheet.weekday3)

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
		params.require(:sheet).permit(:weekday1,:weekday2,:weekday3,:sens,:flames,:oilers,:van_hky,:world,:one,:east,:ontario,:west,:pacific,:is_360,:snipe_required,:team1,:team2,:property_name,:property_id,:user_id,:note,:event_date,:due_date, airtimes_attributes: [:id,:sheet_id,:timezone,:time], promos_attributes: [:id,:length,:quantel_name,:s4m_name,:mcr_number,:purge_date,:sheet_id])
	end
end