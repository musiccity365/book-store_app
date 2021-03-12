# ERD Models
## User
has_many :ratings
has_many :books, through: :ratings
has_secure_password

## Book
has_many :ratings
has_many :users, through: :ratings
accepts_nested_attributes_for :ratings

validates :title, :author, :publisher, :release_year, presence: true

## Rating

belongs_to :user
belongs_to :book
foreign key book_id, user_id
validates :title, presence: true
validates :content, presence: true
validates :score, numericality: {greater_than_or_equal_to: 1}, presence: true
validates :score, numericality: {less_than_or_equal_to: 10}, presence: true

scope :ordered_by_score, -> {order(score: :desc)}