class CreateAcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :acomments do |t|
      t.integer :user_id
      t.integer :activity_id
      t.text :body

      t.timestamps
    end
  end
end
