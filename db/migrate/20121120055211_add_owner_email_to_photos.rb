class AddOwnerEmailToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :owner_email, :string
  end
end
