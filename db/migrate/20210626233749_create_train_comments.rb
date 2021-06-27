class CreateTrainComments < ActiveRecord::Migration[5.2]
  def change
    create_table :train_comments do |t|
      t.integer :user_id, null: false
      t.integer :train_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
