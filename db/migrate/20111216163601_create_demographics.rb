class CreateDemographics < ActiveRecord::Migration
  def change
    create_table :demographics do |t|
      t.integer :subject_id
      t.string :subject_type
      t.string :gender
      t.integer :age
      t.string :race
      t.string :ethnicity
      t.string :twitter_use
      t.text :why_twitter
      t.text :twitter_story

      t.timestamps
    end
  end
end
