class CreateInformants < ActiveRecord::Migration
  def change
    create_table :informants do |t|
      t.integer :participant_id
      t.string :name
      t.string :email
      t.integer :consent_id
      t.integer :ten_items_id
      t.integer :participant_ten_items_id

      t.timestamps
    end
  end
end
