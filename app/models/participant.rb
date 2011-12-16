class Participant < ActiveRecord::Base
  validates :script_id, :presence => :true
  has_one :demographic, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :demographic
  has_one :consent, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :consent
  has_one :ten_items, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :ten_items
  has_many :participant_ten_items
  has_many :informants
  has_many :observers
end
