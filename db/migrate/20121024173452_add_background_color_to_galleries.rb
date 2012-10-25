class AddBackgroundColorToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :background_color, :string, :default => "#ffffff"
  end
end
