class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true

      t.timestamps
    end
    add_index :bookmarks, [:user_id, :library_id], unique: true # user_id と library_id が一意になるように設定
  end
end
