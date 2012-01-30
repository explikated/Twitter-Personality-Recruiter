class ParticipantsController < ApplicationController
  respond_to :html

  def new
    @handle = params["handle"]
    participant = Participant.find_by_handle(@handle)
    redirect_to edit_participant_path(participant) unless participant.nil?
  end

  def create
    @participant = Participant.create(params["participant"])
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
    if @participant.consent.present? and not @participant.consent.consent or not @participant.consent.over_18
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
    informant_emails = [params["informant_email_1"], params["informant_email_2"], params["informant_email_3"]].reject {|e| e.empty?}
    unless informant_emails.empty?
      informant_emails.each do |email|
        informant = Informant.create(:email => email, :participant_id => params["id"])
      end
    end
  end

# def email_informants(participant)
#   participant.informants.each do |informant|
#     InformantMailer.email(informant).deliver
#   end
# end
end
