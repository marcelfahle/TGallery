class AddDownloadLinkToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :download_link, :string
  end
end
