class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :handle
      t.string :name
      t.string :email
      t.integer :consent_id
      t.integer :ten_items_id

      t.timestamps
    end
  end
end
