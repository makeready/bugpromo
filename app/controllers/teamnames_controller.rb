class TeamnamesController < ApplicationController

	def index
		@teamnames = Teamname.all
	end

	def create
		@teamname = Teamname.new(teamname_params)
		if @teamname.save
			redirect_to teamnames_path
		else
			render :index
		end
	end

  def destroy
    @teamname = Teamname.find(params[:id])
    @teamname.destroy
    redirect_to teamnames_path
  end

  def update
    @teamname = Teamname.find(params[:id])

    if @teamname.update_attributes(teamname_params)
      redirect_to teamnames_path
    else
      render :index
    end
  end

	def teamname_params
		params.require(:teamname).permit(:name)
	end
end
