class Addcolumntolibraries < ActiveRecord::Migration[6.1]
  def up
    add_column :libraries, :clean, :integer, default: 0
    add_column :libraries, :comfort, :integer, default: 0
    add_column :libraries, :silent, :integer, default: 0
    add_column :libraries, :desk, :integer, default: 0
    add_column :libraries, :crowd, :integer, default: 0
    add_column :libraries, :quantity, :integer, default: 0
  end

  def down
    remove_column :libraries, :clean, :integer, default: 0
    remove_column :libraries, :comfort, :integer, default: 0
    remove_column :libraries, :silent, :integer, default: 0
    remove_column :libraries, :desk, :integer, default: 0
    remove_column :libraries, :crowd, :integer, default: 0
    remove_column :libraries, :quantity, :integer, default: 0
  end
end
