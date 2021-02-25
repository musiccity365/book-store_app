class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :comment
      t.integer :score
      t.integer :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
