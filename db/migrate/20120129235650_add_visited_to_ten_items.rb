class AddVisitedToTenItems < ActiveRecord::Migration
  def change
    add_column :ten_items, :visited, :boolean
  end
end
