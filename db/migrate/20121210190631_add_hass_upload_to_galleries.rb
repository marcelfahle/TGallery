class AddHassUploadToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :has_upload, :boolean, default: true
  end
end
