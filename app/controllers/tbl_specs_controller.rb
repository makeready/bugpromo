class TblSpecsController < ApplicationController
  def index
    @tbl_specs = TblSpec.order(:id)
    respond_to do |format|
      format.html { render text: @tbl_specs.to_csv }
      format.csv { render text: @tbl_specs.to_csv }
    end
  end

  def show
  	@tbl_spec = TblSpec.where(id: params[:id])
  	respond_to do |format|
  		format.html { render text: @tbl_spec.to_csv}
  		format.csv { render text: @tbl_spec.to_csv}
  	end
  end
end
