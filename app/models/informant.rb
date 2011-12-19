class Informant < ActiveRecord::Base
  has_one :consent, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :consent
  has_one :demographic, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :demographic

  belongs_to :participant
  validates :participant_id, :presence => true
  has_one :participant_ten_item, :as => :subject, :dependent => :destroy, :class_name => "ParticipantTenItems"
  accepts_nested_attributes_for :participant_ten_item
  has_one :ten_item, :as => :subject, :dependent => :destroy, :class_name => "TenItems"
  accepts_nested_attributes_for :ten_item
  
  delegate :present?, :to => :demographic, :prefix => true
  delegate :present?, :to => :ten_item, :prefix => true
  delegate :present?, :to => :participant_ten_item, :prefix => true
  delegate :consented?, :to => :consent

  def done?
    ten_item_present? && 
      participant_ten_item_present? &&
      demographic_present? &&
      consented?
  end
end
