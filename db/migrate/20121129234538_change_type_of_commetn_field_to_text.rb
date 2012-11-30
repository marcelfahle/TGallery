class ChangeTypeOfCommetnFieldToText < ActiveRecord::Migration
  def up
    change_column :comments, :comment, :text
  end

  def down
    change_column :comments, :comment, :string
  end
end
