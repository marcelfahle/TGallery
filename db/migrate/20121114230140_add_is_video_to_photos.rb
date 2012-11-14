class AddIsVideoToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_video, :boolean, default: false
  end
end
