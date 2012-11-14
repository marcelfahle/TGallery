class AddShowNamesToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :show_names, :boolean, default: false
  end
end
