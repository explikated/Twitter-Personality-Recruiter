class Observer < ActiveRecord::Base
  has_one :consent, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :consent
  has_one :demographic, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :demographic

  belongs_to :participant
  validates :participant_id, :presence => true
  has_one :participant_ten_items, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :participant_ten_items
  has_one :ten_items, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :ten_items
end
