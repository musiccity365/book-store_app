# User
has_many :books (written)
has_many :libraries
has_many :books, through :ratings (books they have written)

# Book
belongs_to :user (the author)
has_many :ratings
has_many :users, through :ratings (users who wrote ratings)

# Rating
belongs_to :user
belongs_to :book

