class Participant < ActiveRecord::Base
  validates :handle, :presence => :true, :uniqueness => :true
  has_one :demographic, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :demographic
  has_one :consent, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :consent
  has_one :ten_item, :as => :subject, :dependent => :destroy, :class_name => "TenItems"
  accepts_nested_attributes_for :ten_item
  has_many :informants
  has_many :observers

  delegate :present?, :to => :demographic, :prefix => true
  delegate :present?, :to => :ten_item, :prefix => true
  delegate :consented?, :to => :consent

  def done?
    ten_item_present? &&
      demographic_present? &&
      consented?
  end
end
