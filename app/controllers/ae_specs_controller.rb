class AeSpecsController < ApplicationController
  def index
    if params[:sheet_id] then
      @ae_specs = AeSpec.where(sheet_id: params[:sheet_id])
    else
      @ae_specs = AeSpec.all.order(:id)
    end
    respond_to do |format|
      format.html { render text: @ae_specs}
      format.json { render json: @ae_specs.to_json}
    end
  end
end