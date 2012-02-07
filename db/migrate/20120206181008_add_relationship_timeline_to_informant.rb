class AddRelationshipTimelineToInformant < ActiveRecord::Migration
  def change
	add_column :informants, :participant_knew_you, :integer
	add_column :informants, :you_knew_participant, :integer
	add_column :informants, :relationship_from_participant, :string
	add_column :informants, :relationship_to_participant, :string
  end
end
