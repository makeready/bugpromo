class PropertiesController < ApplicationController

	def index
		@properties = Property.all
	end

	def create
		@property = Property.new(property_params)
		if @property.save
			redirect_to properties_path
		else
			render :index
		end
	end

	def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  def update
    @property = Property.find(params[:id])
    @tbl_specs = @property.tbl_specs
    if @property.update_attributes(property_params)
      @tbl_specs.each do |tbl_spec|
        tbl_spec.image_path = @property.image_path
        tbl_spec.logo_path = @property.logo_path
        tbl_spec.save
      end
      redirect_to properties_path
    else
      render :index
    end
  end

	def property_params
		params.require(:property).permit(:name, :image_path, :logo_path)
	end
end
