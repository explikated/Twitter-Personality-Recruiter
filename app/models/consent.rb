class Consent < ActiveRecord::Base
  belongs_to :subject, :polymorphic => :true

  def consented?
    over_18? && consent? && signature?
  end
end
