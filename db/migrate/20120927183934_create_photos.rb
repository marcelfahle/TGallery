class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :owner
      t.string :image
      t.boolean :is_active

      t.timestamps
    end
  end
end
