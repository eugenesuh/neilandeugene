class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.string :image
      t.string :keyword
      t.string :type
      t.string :duration
      t.string :distance

      t.timestamps
    end
  end
end
