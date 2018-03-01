class CreateGuests < ActiveRecord::Migration[5.1]
  def change
    create_table :guests do |t|
      t.integer :user_id
      t.string :age
      t.string :status
      t.string :food
      t.string :lastname
      t.string :firstname
      t.text :dietary
      t.string :image

      t.timestamps
    end
  end
end
