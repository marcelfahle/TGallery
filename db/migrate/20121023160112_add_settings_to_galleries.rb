class AddSettingsToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :photo_border, :boolean, :default => false
    add_column :galleries, :photo_border_color, :string, :default => "#000000"
    add_column :galleries, :photo_border_width, :integer, :default => 1
    add_column :galleries, :site_width, :integer, :default => nil
    add_column :galleries, :thumb_size, :string, :default => "medium"
  end
end
