class CreatePhotoVotes < ActiveRecord::Migration
  def change
    create_table :photo_votes do |t|
      t.integer :value
      t.integer :photo_id

      t.timestamps
    end
  end
end
