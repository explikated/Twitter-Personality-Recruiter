class CreateObservers < ActiveRecord::Migration
  def change
    create_table :observers do |t|
      t.integer :participant_id
      t.integer :consent_id
      t.integer :ten_items_id
      t.integer :participant_ten_items_id

      t.timestamps
    end
  end
end
