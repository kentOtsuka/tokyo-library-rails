class AddColumnToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :body, :text, null: false
  end
end
