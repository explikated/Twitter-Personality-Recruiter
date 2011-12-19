class CreateInformants < ActiveRecord::Migration
  def change
    create_table :informants do |t|
      t.integer :participant_id
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
