class ParticipantTenItemsController < ApplicationController
  respond_to :html
  
  def new
    @observer = Observer.find(params[:observer_id])
  end

  def create
    participant_ten_items = ParticipantTenItems.create(params[:participant_ten_items])
    observer = Observer.find(params[:observer_id])
    respond_with participant_ten_items, :location => observer_path(observer)
  end
end
