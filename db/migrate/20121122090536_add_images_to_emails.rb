class AddImagesToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :image_thumb, :string
    add_column :emails, :image_full, :string
  end
end
