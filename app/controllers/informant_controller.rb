class InformantController < ApplicationController
  respond_to :html

  def new
    @informant = @participant.informants.new
  end

  def create
    @informant = Informant.create(params[:participant])
    respond_with @informant
  end
end
