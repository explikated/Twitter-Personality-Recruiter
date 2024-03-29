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
      @partial = "survey"
      @partial = "demographics" if @observer.ten_item_present?
    end
    redirect_to observer_path(@observer) if @observer.done?
  end

  def update
    @observer = Observer.find(params["id"])
    @observer.update_attributes(params["observer"])

    if @observer.consent.present and (not @observer.consent.consent or not @observer.consent.over_18)
      redirect_to thank_you_anyways_path
    else
      destination = edit_observer_path(@observer)
      destination = observer_path(@observer) if @observer.done?
      respond_with @observer, :location => destination
    end
  end

  def show
    @observer = Observer.find(params["id"])
  end
end
