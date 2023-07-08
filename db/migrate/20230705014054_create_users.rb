class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :age
      t.integer :weight
      t.integer :height
      t.string :gender

      t.timestamps
    end
  end
end