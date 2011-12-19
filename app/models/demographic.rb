class Demographic < ActiveRecord::Base
belongs_to :subject, :polymorphic => true
has_and_belongs_to_many :other_sites
end
