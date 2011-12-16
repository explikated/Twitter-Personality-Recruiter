class ParticipantController < ApplicationController
  respond_to :html

  def new
    @participant = Participant.build(:handle => params[:script_id])
  end

  def create
    @participant = Participant.create(params[:participant])
    respond_with @participant
  end
end
