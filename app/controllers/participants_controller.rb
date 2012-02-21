class ParticipantsController < ApplicationController
  respond_to :html

  def new
  end

  def create
	unless @participant = Participant.find_by_handle(params["participant"]["handle"])
	    @participant = Participant.create(params["participant"])
	end
    respond_with @participant, :location => edit_participant_path(@participant)
  end

  def edit
    @participant = Participant.find(params["id"])
    redirect_to thank_you_index_path if @participant.done?

    @partial = "consent"
    if @participant.consent.present? && @participant.consented?
      @partial = "survey"
      @partial = "demographics" if @participant.ten_item_present?
    end
  end

  def update
    @participant = Participant.find(params["id"])
    @participant.update_attributes(params["participant"])

    create_informants(params) if params["participant"]["email"]
    if @participant.consent.present? and (not @participant.consent.consent or not @participant.consent.over_18)
      redirect_to thank_you_anyways_path
    else
  #   email_informants(@participant) if @participant.done?
      destination = edit_participant_path(@participant)
      destination = thank_you_index_path if @participant.done?
      respond_with @participant, :location => destination
    end
  end

  private

  def create_informants(params)
    informant_data = [
			{:email => params["informant_1_email"], :relationship => params["informant_1_relationship"], :length => params["informant_1_length"]},
			{:email => params["informant_2_email"], :relationship => params["informant_2_relationship"], :length => params["informant_2_length"]},
			{:email => params["informant_3_email"], :relationship => params["informant_3_relationship"], :length => params["informant_3_length"]},
			].reject {|i| i[:email].empty?}
    unless informant_data.empty?
      informant_data.each do |i|
	informant_params = {
			:email => i[:email],
			:participant_knew_you => i[:length],
			:relationship_from_participant => i[:relationship],
			:participant_id => params["id"] }
        informant = Informant.create(informant_params)
      end
    end
  end

# def email_informants(participant)
#   participant.informants.each do |informant|
#     InformantMailer.email(informant).deliver
#   end
# end
end
