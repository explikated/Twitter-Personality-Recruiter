class ObserversController < ApplicationController
  respond_to :html

  def new
    @observer = @participant.observers.new
  end

  def create
    @observer = Observer.create(params[:participant])
    respond_with @observer
  end
end
