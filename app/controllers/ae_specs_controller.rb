class AeSpecsController < ApplicationController
  def index
    if params[:sheet_id] then
      @ae_specs = AeSpec.where(sheet_id: params[:sheet_id])
    else
      @ae_specs = AeSpec.all.order(:id)
    end
    content = ""
    @ae_specs.each do |ae_spec|
      content += '"teamA = ["' + ae_spec.team1 + '"]'
      content += "</br>"
      content += 'teamB = ["' + ae_spec.team2 + '"]'
      content += "</br>"
      content += 'day = ["' + ae_spec.day + '"]'
      content += "</br>"
      content += 'start = ["' + ae_spec.start + '"]"'
      content += "</br>"
      content += "</br>"
    end
    respond_to do |format|
      format.html { render text: content }
    end
  end
end