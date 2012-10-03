class AddTextColorToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :text_color, :string, :default => "#000000"
  end
end
