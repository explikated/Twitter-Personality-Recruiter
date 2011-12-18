class InformantMailer < ActionMailer::Base
  default :from => "PersonalityResearch@olin.edu"

  def email(informant)
    @informant = informant
    @participant = informant.participant
    @url = "www.olin-personality.com/paritipants/#{@participant.id}/informants/#{@informant.id}/edit"
    mail(:to => informant.email, :cc => @participant.email, :subject => "Participate in study about Personality and Twitter")
  end
end
