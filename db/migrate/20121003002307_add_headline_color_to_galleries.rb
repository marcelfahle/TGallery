class AddHeadlineColorToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :headline_color, :string, :default => "#000000"
  end
end
