class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :book, index: true, foreign_key: true

      t.timestamps
    end
  end
end
