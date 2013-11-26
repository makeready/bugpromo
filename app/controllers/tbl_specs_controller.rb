class TblSpecsController < ApplicationController
  def index
    if params[:sheet_id] then
      @tbl_specs = TblSpec.where(sheet_id: params[:sheet_id])
    else
      @tbl_specs = TblSpec.all.order(:id)
    end
    respond_to do |format|
      format.html { render text: @tbl_specs.to_csv }
      format.csv { render text: @tbl_specs.to_csv }
    end
  end
end
