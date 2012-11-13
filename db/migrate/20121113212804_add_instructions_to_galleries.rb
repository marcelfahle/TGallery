class AddInstructionsToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :instructions, :text
  end
end
