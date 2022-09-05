class AddcolumntoLibraries < ActiveRecord::Migration[6.1]
  def up
    add_column :libraries, :clean, :integer
    add_column :libraries, :comfort, :integer
    add_column :libraries, :silent, :integer
    add_column :libraries, :desk, :integer
    add_column :libraries, :crowd, :integer
    add_column :libraries, :quantity, :integer
  end

  def down
    remove_column :libraries, :clean, :integer
    remove_column :libraries, :comfort, :integer
    remove_column :libraries, :silent, :integer
    remove_column :libraries, :desk, :integer
    remove_column :libraries, :crowd, :integer
    remove_column :libraries, :quantity, :integer
  end
end
