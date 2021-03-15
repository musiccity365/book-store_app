class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :title, presence: true
  validates :content, presence: true
  validates :score, numericality: {greater_than_or_equal_to: 1}, presence: true
  validates :score, numericality: {less_than_or_equal_to: 10}, presence: true
  validates :score, numericality: true

  scope :ordered_by_score, -> {order(score: :desc)}
end

