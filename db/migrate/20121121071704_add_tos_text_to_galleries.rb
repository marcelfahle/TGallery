class AddTosTextToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :tos_text, :string
  end
end
