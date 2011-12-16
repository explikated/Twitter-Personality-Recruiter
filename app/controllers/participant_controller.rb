class ParticipantController < ApplicationController
  def new
    @participant = Participant.build(:handle => params[:script_id])
  end

end
