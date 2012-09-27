class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :email
      t.string :background
      t.boolean :has_rating
      t.boolean :has_comments

      t.timestamps
    end
  end
end
