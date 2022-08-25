class AddDetailstoLibraries < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries, :lat, :decimal, precision: 11, scale: 8
    add_column :libraries, :lng, :decimal, precision: 11, scale: 8
  end
end
