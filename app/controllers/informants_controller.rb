class InformantsController < ApplicationController
  respond_to :html

  def show 
    @informant = Informant.find(params["id"])
  end

  def edit
    @informant = Informant.find(params["id"])
    redirect_to thank_you_index_path if @informant.done?

    @partial = "consent"
    if @informant.consent.present? && @informant.consented?
      @partial = "email"
      @partial = "participant_survey" if @informant.email?
      @partial = "survey" if @informant.participant_ten_item_present?
      @partial = "demographics" if @informant.ten_item_present?
    end
  end

  def update
    @informant = Informant.find(params["id"])
    @informant.update_attributes(params["informant"])

    if @informant.consent.present? and (not @informant.consent.consent or not @informant.consent.over_18)
      redirect_to thank_you_anyways_path
    else
      destination = edit_participant_informant_path(@informant.participant, @informant)
      destination = thank_you_index_path if @informant.done?
      respond_with @informant, :location => destination
    end
  end
end
