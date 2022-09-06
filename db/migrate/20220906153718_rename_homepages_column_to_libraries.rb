class RenameHomepagesColumnToLibraries < ActiveRecord::Migration[6.1]
  def change
    rename_column :libraries, :homepages, :homepage
  end
end
