class CreateConsents < ActiveRecord::Migration
  def change
    create_table :consents do |t|
      t.boolean :consent
      t.boolean :over_18
      t.string :signature
      t.integer :subject_id
      t.string :subject_type

      t.timestamps
    end
  end
end
