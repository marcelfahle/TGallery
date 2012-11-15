class ChangeDataTypeForPhotoCaption < ActiveRecord::Migration
  def up
    change_table :photos do |t|
      t.change :caption, :text, limit: 64.kilobytes
    end
  end

  def down
    change_table :photos do |t|
      t.change :caption, :string
    end
  end
end
