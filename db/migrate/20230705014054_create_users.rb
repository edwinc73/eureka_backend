class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :image
      t.integer :age
      t.float :weight
      t.integer :height
      t.string :gender
      t.float :goal_weight

      t.timestamps
    end
  end
end
