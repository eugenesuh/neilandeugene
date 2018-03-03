class CreateRsvps < ActiveRecord::Migration[5.1]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
