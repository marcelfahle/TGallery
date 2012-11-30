class AddConfirmationTextToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :confirmation_text, :text
  end
end
