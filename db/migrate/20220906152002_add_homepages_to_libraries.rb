class AddHomepagesToLibraries < ActiveRecord::Migration[6.1]
  def change
    add_column :libraries, :homepages, :string
  end
end
