class AddPhotoIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :photo_id, :integer
    add_index :comments, [:photo_id, :created_at]
  end
end
