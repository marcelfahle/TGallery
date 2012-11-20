class AddIsActiveToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :is_active, :boolean
  end
end
