class CreateTrains < ActiveRecord::Migration[5.2]
  def change
    create_table :trains do |t|
      t.integer :user_id, null: false
      t.text :body, null: false
      t.string :train_image_id, null: false
      t.integer :line, null: false

      t.timestamps
    end
  end
end
