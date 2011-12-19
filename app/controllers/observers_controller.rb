class ObserversController < ApplicationController
  respond_to :html

  def new
    @observer = Observer.new
  end

  def create
    @observer = Observer.create()
    respond_with @observer, :location => edit_observer_path(@observer)
  end

  def edit
    @observer = Observer.find(params["id"])
    
    @partial = "consent"
    if @observer.consent.present? && @observer.consented?
      @partial = "email"
      @partial = "survey" if @observer.email?
      @partial = "demographics" if @observer.ten_item_present?
    end
    redirect_to observer_path(@observer) if @observer.done?
  end

  def update
    @observer = Observer.find(params["id"])
    @observer.update_attributes(params["observer"])

    destination = edit_observer_path(@observer)
    destination = observer_path(@observer) if @observer.done?
    respond_with @observer, :location => destination
  end

  def show
    @observer = Observer.find(params["id"])
  end
end
