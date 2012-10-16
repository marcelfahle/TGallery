class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.string :author_name
      t.string :author_email

      t.timestamps
    end
  end
end
