class AddVideoPosterToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :video_poster, :string
  end
end
