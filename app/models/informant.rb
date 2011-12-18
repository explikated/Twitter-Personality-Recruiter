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
  
  delegate :exists, :to => :demographic, :prefix => true
  delegate :exists, :to => :ten_items, :prefix => true
  delegate :exists, :to => :participant_ten_items, :prefix => true
  delegate :consented, :to => :consent

  def done?
    ten_items_exists? && 
      participant_ten_items_exists? &&
      demographic_exists? &&
      consented?
  end
end
