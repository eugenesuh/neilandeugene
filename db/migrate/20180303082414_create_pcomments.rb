class CreatePcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :pcomments do |t|
      t.integer :user_id
      t.integer :photo_id
      t.text :body

      t.timestamps
    end
  end
end
