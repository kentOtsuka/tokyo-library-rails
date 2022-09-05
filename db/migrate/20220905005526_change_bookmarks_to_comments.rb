class ChangeBookmarksToComments < ActiveRecord::Migration[6.1]
  def change
    rename_table :bookmarks, :comments
  end
end
