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

	def sheet_params
		params.require(:sheet).permit(:sens,:flames,:oilers,:van_hky,:world,:one,:east,:ontario,:west,:pacific,:is_360,:snipe_required,:team1,:team2,:property_name,:property_id,:user_id,:note,:event_date,:due_date, airtimes_attributes: [:sheet_id,:timezone,:time], promos_attributes: [:length,:quantel_name,:s4m_name,:mcr_number,:purge_date,:sheet_id])
	end
end




    # t.boolean  "sens"
    # t.boolean  "flames"
    # t.boolean  "oilers"
    # t.boolean  "van_hky"
    # t.boolean  "world"
    # t.boolean  "one"
    # t.boolean  "east"
    # t.boolean  "ontario"
    # t.boolean  "west"
    # t.boolean  "pacific"
    # t.boolean  "is_360"
    # t.boolean  "snipe_required"
    # t.string   "weekday1"
    # t.string   "weekday2"
    # t.string   "weekday3"
    # t.integer  "user_id" 
    # t.integer  "property_id"
    # t.date     "event_date"
    # t.date     "due_date"
    # t.text     "note"
    # t.string   "team1"
    # t.string   "team2"