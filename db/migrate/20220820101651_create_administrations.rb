class CreateAdministrations < ActiveRecord::Migration[6.1]
  def change
    create_table :administrations do |t|
      t.string :name, null: false
      t.string :homepage, null: false

      t.timestamps
    end
  end
end
