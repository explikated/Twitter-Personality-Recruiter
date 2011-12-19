class Observer < ActiveRecord::Base
  has_one :consent, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :consent
  has_one :demographic, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :demographic

  has_many :participant_ten_items, :as => :subject, :dependent => :destroy, :class_name => "ParticipantTenItems"
  accepts_nested_attributes_for :participant_ten_items
  has_one :ten_item, :as => :subject, :dependent => :destroy, :class_name => "TenItems"
  accepts_nested_attributes_for :ten_item

  delegate :present?, :to => :demographic, :prefix => true
  delegate :present?, :to => :ten_item, :prefix => true
  delegate :consented?, :to => :consent

  def done?
    consent.present? && consented? && demographic_present? && ten_item_present?
  end
end
