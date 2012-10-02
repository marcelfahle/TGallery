class AddTopMarginToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :top_margin, :integer, :default => 0
  end
end
