class CreateSlikes < ActiveRecord::Migration[5.1]
  def change
    create_table :slikes do |t|
      t.integer :user_id
      t.integer :song_id

      t.timestamps
    end
  end
end
