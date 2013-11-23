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

    if @property.update_attributes(property_params)
      redirect_to properties_path
    else
      render :index
    end
  end

	def property_params
		params.require(:property).permit(:name, :image_path)
	end
end
