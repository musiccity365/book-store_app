# User
has_many :books (read)
has_many :ratings
has_many :ratings, through :books (ratings they have written)

# Book
belongs_to :user (the author)
has_many :ratings
has_many :ratings, through :users (users who wrote ratings)

# Rating
belongs_to :user
belongs_to :book
text :string

# Category
has_many :books
has_many :users, through :books (add foreign keys)

# User (protect edit view)
has_many :books
# Book
belongs_to :category
belongs_to :user