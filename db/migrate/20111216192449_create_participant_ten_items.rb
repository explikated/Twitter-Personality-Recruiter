class CreateParticipantTenItems < ActiveRecord::Migration
  def change
    create_table :participant_ten_items do |t|
      t.integer :subject_id
      t.string  :subject_type
      t.integer :participant_id
      t.integer :extraverted
      t.integer :critical
      t.integer :dependable
      t.integer :anxious
      t.integer :open
      t.integer :reserved
      t.integer :reserved
      t.integer :sympathetic
      t.integer :disorganized
      t.integer :calm
      t.integer :conventional


      t.timestamps
    end
  end
end
