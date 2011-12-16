class CreateDemographicsOtherSitesJoinTable < ActiveRecord::Migration
  def change
    create_table :demographics_other_sites, :id => false do |t|
      t.integer :demographics_id
      t.integer :other_site_id
    end
  end
end
