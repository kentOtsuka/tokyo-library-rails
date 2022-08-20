class CreateLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :libraries do |t|
      t.references :administration
      t.string :name
      t.string :phone_number
      t.string :post_code
      t.string :address
      t.time :open_time
      t.time :close_time
      t.string :opening_details
      t.string :closed_body_first
      t.string :closed_body_second
      t.integer :seats

      t.timestamps
    end
  end
end
