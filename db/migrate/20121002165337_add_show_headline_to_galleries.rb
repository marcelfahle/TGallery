class AddShowHeadlineToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :show_headline, :boolean, :default => true
  end
end
