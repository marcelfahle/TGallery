class AddVideoToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :video, :string
  end
end
