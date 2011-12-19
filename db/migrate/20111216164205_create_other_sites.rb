class CreateOtherSites < ActiveRecord::Migration
  def change
    create_table :other_sites do |t|
      t.string :site

      t.timestamps
    end
  end
end
