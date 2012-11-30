class ChangeNameOfCommentField < ActiveRecord::Migration
  def up
    rename_column :comments, :text, :comment
  end

  def down
    rename_column :comments, :comment, :text
  end
end
