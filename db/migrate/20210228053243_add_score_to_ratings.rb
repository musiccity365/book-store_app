class AddScoreToRatings < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :ratings, :score
  end
end
